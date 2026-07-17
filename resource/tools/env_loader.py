"""Carrega .env do projeto e aplica variáveis ao Robot Framework (ADR 0004)."""

from __future__ import annotations

import os
from pathlib import Path

from dotenv import load_dotenv
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

# Chaves que o dotenv pode injetar como variáveis Robot globais.
ENV_KEYS = (
    "PLATFORM_NAME",
    "ENVIRONMENT",
    "PATH_VERSIONS",
    "APPIUM_SERVER_LOCAL",
    "ANDROID_APP_LOCAL",
    "IOS_APP_LOCAL",
    "APPIUM_SERVER_BS",
    "PROJECT_NAME_BS",
    "BUILD_BS",
    "USERNAME_BS",
    "ACESSKEY_BS",
    "APP_IOS_BS",
    "APP_ANDROID_BS",
    "MAILSAC_URL",
    "MAILSAC_TOKEN",
    "TAGS",
)

BS_REQUIRED = ("USERNAME_BS", "ACESSKEY_BS")

_LOADED = False


def _builtin() -> BuiltIn:
    return BuiltIn()


def _robot_var(name: str) -> str:
    value = _builtin().get_variable_value(f"${{{name}}}")
    if value is None:
        return ""
    return str(value).strip()


def _set_robot_var(name: str, value: str) -> None:
    _builtin().set_global_variable(f"${{{name}}}", value)


def _env_path() -> Path:
    execdir = _builtin().get_variable_value("${EXECDIR}")
    return Path(execdir) / ".env"


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
        # Permite CI/shell sem arquivo .env; não falha aqui.
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

    _LOADED = True


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
            "Faça upload do app no BrowserStack App Automate e defina o id bs:// no .env."
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
