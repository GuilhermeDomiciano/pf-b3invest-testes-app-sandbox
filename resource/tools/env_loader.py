"""Carrega .env do projeto e aplica variáveis ao Robot Framework (ADR 0004)."""

from __future__ import annotations

import os
from datetime import datetime
from pathlib import Path

from dotenv import load_dotenv
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

# Chaves que o dotenv pode injetar como variáveis Robot globais.
# PLATFORM_NAME / ENVIRONMENT / TAGS ficam de fora: vêm do CLI (-v) / makefile
# e não devem ser sobrescritas por ENVIRONMENT=local no .env.
ENV_KEYS = (
    "PATH_VERSIONS",
    "APPIUM_SERVER_LOCAL",
    "ANDROID_APP_LOCAL",
    "IOS_APP_LOCAL",
    "APPIUM_SERVER_BS",
    "PROJECT_NAME_BS",
    "BUILD_BS",
    "BUILD_NUMBER",
    "USERNAME_BS",
    "ACESSKEY_BS",
    "APP_IOS_BS",
    "APP_ANDROID_BS",
    "DEVICE_NAME_BS",
    "PLATFORM_VERSION_BS",
    "BS_DEBUG",
    "BS_NETWORK_LOGS",
    "BS_APP_PROFILING",
    "APPIUM_VERSION_BS",
    "MAILSAC_URL",
    "MAILSAC_TOKEN",
)

BS_REQUIRED = ("USERNAME_BS", "ACESSKEY_BS")

# Defaults de device (opção B: override livre via DEVICE_NAME_BS / PLATFORM_VERSION_BS).
DEFAULT_DEVICE_ANDROID = "Samsung Galaxy S23"
DEFAULT_VERSION_ANDROID = "13.0"
DEFAULT_DEVICE_IOS = "iPhone 15"
DEFAULT_VERSION_IOS = "17"

_LOADED = False


def _builtin() -> BuiltIn:
    return BuiltIn()


def _robot_var(name: str) -> str:
    value = _builtin().get_variable_value(f"${{{name}}}")
    if value is None:
        return ""
    return str(value).strip()


def _set_robot_var(name: str, value) -> None:
    """Define variável Robot sem vazar secrets no log."""
    builtin = _builtin()
    secret_keys = {"USERNAME_BS", "ACESSKEY_BS", "MAILSAC_TOKEN", "BROWSERSTACK_URL"}
    if name in secret_keys:
        prev = builtin.set_log_level("NONE")
        try:
            builtin.set_global_variable(f"${{{name}}}", value)
        finally:
            builtin.set_log_level(prev)
        builtin.log(f"${{{name}}} = ***", "INFO")
    else:
        builtin.set_global_variable(f"${{{name}}}", value)


def _env_path() -> Path:
    execdir = _builtin().get_variable_value("${EXECDIR}")
    return Path(execdir) / ".env"


def _as_bool(raw: str, default: bool = True) -> bool:
    if raw is None or str(raw).strip() == "":
        return default
    return str(raw).strip().lower() in {"1", "true", "yes", "y", "on"}


def _resolve_build_name() -> str:
    """BUILD_NUMBER (CI) > BUILD_BS > fallback local-YYYYMMDD-HHmmss."""
    for key in ("BUILD_NUMBER", "BUILD_BS"):
        val = os.environ.get(key) or _robot_var(key)
        if val and str(val).strip():
            return str(val).strip()
    return f"local-{datetime.now().strftime('%Y%m%d-%H%M%S')}"


@keyword("Load Project Environment")
def load_project_environment() -> None:
    """Carrega `.env` (se existir) e aplica chaves conhecidas às variáveis Robot.

    Variáveis já definidas via CLI (`robot -v`) ou processo têm prioridade:
    `load_dotenv(..., override=False)` não sobrescreve `os.environ` existente;
    só aplicamos ao Robot valores presentes em `os.environ` após o load.
    """
    global _LOADED
    path = _env_path()
    if path.is_file():
        load_dotenv(dotenv_path=path, override=False)
    else:
        load_dotenv(override=False)

    for key in ENV_KEYS:
        val = os.environ.get(key)
        if val is None:
            continue
        val = val.strip()
        if val == "":
            continue
        _set_robot_var(key, val)

    user = _robot_var("USERNAME_BS")
    access = _robot_var("ACESSKEY_BS")
    if user and access:
        _set_robot_var(
            "BROWSERSTACK_URL",
            f"https://{user}:{access}@api-cloud.browserstack.com",
        )

    _set_robot_var("BUILD_BS", _resolve_build_name())
    _LOADED = True


@keyword("Resolve Browserstack Device")
def resolve_browserstack_device(platform_name: str) -> dict:
    """Retorna deviceName e platformVersion (env livre ou default por plataforma)."""
    if not _LOADED:
        load_project_environment()

    platform = (platform_name or "").strip().lower()
    override_device = _robot_var("DEVICE_NAME_BS")
    override_version = _robot_var("PLATFORM_VERSION_BS")

    if platform == "android":
        device = override_device or DEFAULT_DEVICE_ANDROID
        version = override_version or DEFAULT_VERSION_ANDROID
    elif platform == "ios":
        device = override_device or DEFAULT_DEVICE_IOS
        version = override_version or DEFAULT_VERSION_IOS
    else:
        raise AssertionError(f"Plataforma não configurada para BrowserStack: {platform_name}")

    return {"deviceName": device, "platformVersion": version}


class _RedactedBstackOptions(dict):
    """dict que não imprime accessKey/userName no log do Robot."""

    def __repr__(self) -> str:
        safe = {
            k: ("***" if k in {"userName", "accessKey"} else v) for k, v in self.items()
        }
        return repr(safe)

    __str__ = __repr__


@keyword("Build Browserstack Options")
def build_browserstack_options(session_name: str = "") -> dict:
    """Monta o dicionário bstack:options (credenciais + flags de debug)."""
    if not _LOADED:
        load_project_environment()

    validate_browserstack_secrets()

    project = _robot_var("PROJECT_NAME_BS") or "Automacao APP B3i"
    build = _robot_var("BUILD_BS") or _resolve_build_name()
    appium_version = _robot_var("APPIUM_VERSION_BS") or "2.12.1"

    options = _RedactedBstackOptions(
        {
            "userName": _robot_var("USERNAME_BS"),
            "accessKey": _robot_var("ACESSKEY_BS"),
            "projectName": project,
            "buildName": build,
            "sessionName": session_name or _robot_var("TEST_NAME") or "robot-session",
            "appiumVersion": appium_version,
            "debug": _as_bool(_robot_var("BS_DEBUG") or os.environ.get("BS_DEBUG", ""), True),
            "networkLogs": _as_bool(
                _robot_var("BS_NETWORK_LOGS") or os.environ.get("BS_NETWORK_LOGS", ""), True
            ),
            "appProfiling": _as_bool(
                _robot_var("BS_APP_PROFILING") or os.environ.get("BS_APP_PROFILING", ""), True
            ),
        }
    )
    return options


@keyword("Validate Browserstack Secrets")
def validate_browserstack_secrets() -> None:
    """Falha de forma explícita se credenciais BS obrigatórias estiverem ausentes."""
    if not _LOADED:
        load_project_environment()

    missing = [key for key in BS_REQUIRED if not _robot_var(key)]
    if missing:
        raise AssertionError(
            "Variáveis obrigatórias ausentes para ENVIRONMENT=bs: "
            f"{', '.join(missing)}. "
            "Copie .env.example para .env e preencha os valores "
            "(ou exporte as variáveis no ambiente)."
        )


@keyword("Validate Browserstack App Id")
def validate_browserstack_app_id(platform_name: str) -> None:
    """Exige app id `bs://...` para a plataforma alvo."""
    if not _LOADED:
        load_project_environment()

    platform = (platform_name or "").strip().lower()
    if platform == "android":
        key = "APP_ANDROID_BS"
    elif platform == "ios":
        key = "APP_IOS_BS"
    else:
        raise AssertionError(f"Plataforma não configurada para BrowserStack: {platform_name}")

    app_id = _robot_var(key)
    if not app_id or app_id in {"bs://", "bs://<app-id>"}:
        raise AssertionError(
            f"{key} ausente ou placeholder. "
            "Faça upload com `python resource/tools/bs_upload_app.py` "
            "ou defina o id bs:// no .env."
        )


@keyword("Validate Mailsac Token")
def validate_mailsac_token() -> None:
    """Falha se MAILSAC_TOKEN não estiver disponível para chamadas à API."""
    if not _LOADED:
        load_project_environment()

    if not _robot_var("MAILSAC_TOKEN"):
        raise AssertionError(
            "MAILSAC_TOKEN ausente. "
            "Copie .env.example para .env e preencha MAILSAC_TOKEN "
            "(ou exporte a variável no ambiente)."
        )
