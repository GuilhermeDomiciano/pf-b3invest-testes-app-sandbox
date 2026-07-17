"""Upload de APK/IPA/AAB para BrowserStack App Automate.

Retorna o app_url (`bs://...`) no stdout. Opcionalmente atualiza o `.env`.

Exemplos (preferir o launcher):
  python scripts/bs_upload_app.py --file ./app/app.apk --platform android --update-env
  python scripts/bs_upload_app.py --file ./app/Runner.ipa --platform ios --update-env
"""

from __future__ import annotations

import argparse
import os
import re
import sys
from pathlib import Path

import requests
from dotenv import load_dotenv
from requests.exceptions import SSLError

UPLOAD_URL = "https://api-cloud.browserstack.com/app-automate/upload"
ENV_KEY_BY_PLATFORM = {
    "android": "APP_ANDROID_BS",
    "ios": "APP_IOS_BS",
}


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _load_credentials() -> tuple[str, str]:
    load_dotenv(_repo_root() / ".env", override=False)
    user = (os.environ.get("USERNAME_BS") or "").strip()
    key = (os.environ.get("ACESSKEY_BS") or "").strip()
    if not user or not key:
        raise SystemExit(
            "USERNAME_BS e ACESSKEY_BS são obrigatórios. "
            "Preencha o .env (copie de .env.example) antes do upload."
        )
    return user, key


def _ssl_verify(insecure: bool) -> bool | str:
    """CA bundle corporativo (BS_CA_BUNDLE) ou False se insecure / BS_SSL_VERIFY=false."""
    if insecure:
        return False
    flag = (os.environ.get("BS_SSL_VERIFY") or "true").strip().lower()
    if flag in {"0", "false", "no", "off"}:
        return False
    ca = (os.environ.get("BS_CA_BUNDLE") or os.environ.get("REQUESTS_CA_BUNDLE") or "").strip()
    if ca:
        return ca
    return True


def _upload(
    *,
    user: str,
    key: str,
    file_path: Path | None,
    url: str | None,
    custom_id: str | None,
    verify: bool | str,
) -> str:
    data: dict[str, str] = {}
    if custom_id:
        data["custom_id"] = custom_id

    files = None
    if file_path is not None:
        if not file_path.is_file():
            raise SystemExit(f"Arquivo não encontrado: {file_path}")
        files = {"file": (file_path.name, file_path.open("rb"), "application/octet-stream")}
    elif url:
        data["url"] = url
    else:
        raise SystemExit("Informe --file ou --url.")

    if verify is False:
        print(
            "Aviso: verificação SSL desligada (BS_SSL_VERIFY=false ou --insecure). "
            "Use só em rede corporativa com inspeção SSL.",
            file=sys.stderr,
        )
        # Evita spam de InsecureRequestWarning no stdout do app_url
        import urllib3

        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

    try:
        try:
            response = requests.post(
                UPLOAD_URL,
                auth=(user, key),
                data=data or None,
                files=files,
                timeout=600,
                verify=verify,
            )
        except SSLError as exc:
            raise SystemExit(
                "Falha SSL ao falar com api-cloud.browserstack.com "
                "(comum com proxy/inspeção corporativa).\n"
                "Opções:\n"
                "  1) Defina BS_CA_BUNDLE=caminho\\\\para\\\\ca-corporativa.pem no .env\n"
                "  2) Ou BS_SSL_VERIFY=false no .env (menos seguro)\n"
                "  3) Ou passe --insecure neste comando\n"
                f"Detalhe: {exc}"
            ) from exc
    finally:
        if files:
            files["file"][1].close()

    if response.status_code >= 400:
        body = response.text.strip()
        lower = body.lower()
        if "zscaler" in lower or "not allowed to access this file type" in lower:
            raise SystemExit(
                f"Upload bloqueado pelo proxy corporativo (Zscaler) — HTTP {response.status_code}.\n"
                "Motivo típico: 'Not allowed to access this file type' (.ipa/.apk no POST).\n"
                "Workarounds:\n"
                "  1) Upload pelo dashboard BrowserStack → App Automate → Upload App\n"
                "     e cole o bs:// em APP_IOS_BS / APP_ANDROID_BS no .env\n"
                "  2) Abrir chamado Service Desk (servicedesk@b3.com.br / 2565-6100)\n"
                "     pedindo liberação de upload para api-cloud.browserstack.com\n"
                "  3) Rodar o upload fora da rede B3 (ou rede sem bloqueio de file type)\n"
                "  4) Se o binário já estiver em URL pública: "
                "`python scripts/bs_upload_app.py --url https://... --platform ios --update-env`"
            )
        raise SystemExit(f"Upload falhou (HTTP {response.status_code}): {body[:500]}")

    payload = response.json()
    app_url = payload.get("app_url")
    if not app_url:
        raise SystemExit(f"Resposta sem app_url: {payload}")
    return app_url


def _update_env(platform: str, app_url: str) -> None:
    env_path = _repo_root() / ".env"
    key = ENV_KEY_BY_PLATFORM[platform]
    if not env_path.is_file():
        raise SystemExit(f".env não encontrado em {env_path}. Crie a partir de .env.example.")

    text = env_path.read_text(encoding="utf-8")
    pattern = re.compile(rf"(?m)^{re.escape(key)}=.*$")
    line = f"{key}={app_url}"
    if pattern.search(text):
        text = pattern.sub(line, text)
    else:
        if not text.endswith("\n"):
            text += "\n"
        text += f"{line}\n"
    env_path.write_text(text, encoding="utf-8")
    print(f"Atualizado {env_path.name}: {key}={app_url}", file=sys.stderr)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Upload de app para BrowserStack App Automate (retorna bs://)."
    )
    parser.add_argument("--file", type=Path, help="Caminho local do .apk / .aab / .ipa")
    parser.add_argument("--url", help="URL pública do binário (alternativa a --file)")
    parser.add_argument(
        "--platform",
        choices=("android", "ios"),
        required=True,
        help="Plataforma (define qual chave APP_*_BS atualizar com --update-env)",
    )
    parser.add_argument(
        "--custom-id",
        help="custom_id opcional no BrowserStack (reuso do último upload com o mesmo id)",
    )
    parser.add_argument(
        "--update-env",
        action="store_true",
        help="Grava o app_url em APP_ANDROID_BS ou APP_IOS_BS no .env local",
    )
    parser.add_argument(
        "--insecure",
        action="store_true",
        help="Desliga verificação SSL (equivalente a BS_SSL_VERIFY=false)",
    )
    args = parser.parse_args(argv)

    if bool(args.file) == bool(args.url):
        parser.error("Informe exatamente um de: --file ou --url")

    user, key = _load_credentials()
    app_url = _upload(
        user=user,
        key=key,
        file_path=args.file.resolve() if args.file else None,
        url=args.url,
        custom_id=args.custom_id,
        verify=_ssl_verify(args.insecure),
    )
    print(app_url)
    if args.update_env:
        _update_env(args.platform, app_url)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
