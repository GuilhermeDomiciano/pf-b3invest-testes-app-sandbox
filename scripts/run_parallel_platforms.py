"""Roda a mesma suite em Android e iOS em paralelo (dois processos robot).

Exemplos:
  python scripts/run_parallel_platforms.py --env bs --include acesso
  python scripts/run_parallel_platforms.py --env bs --include regressivo --suite robot/tests/login.robot
  python scripts/run_parallel_platforms.py --env local --include acesso

Logs: logs/parallel/<env>/android e logs/parallel/<env>/ios
Exit code != 0 se qualquer plataforma falhar.
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import threading
from pathlib import Path


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def _which_robot() -> str:
    robot = shutil.which("robot")
    if not robot:
        raise SystemExit(
            "Comando 'robot' não encontrado no PATH. "
            "Instale com: python -m pip install -r config/requirements.txt"
        )
    return robot


def _run_platform(
    *,
    robot: str,
    platform: str,
    environment: str,
    include: str | None,
    suite: str,
    output_dir: Path,
    extra_vars: list[str],
    results: dict[str, int],
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    cmd = [
        robot,
        "-v",
        f"PLATFORM_NAME:{platform}",
        "-v",
        f"ENVIRONMENT:{environment}",
        "-d",
        str(output_dir),
        "--name",
        f"{platform}-{environment}",
    ]
    if include:
        cmd.extend(["-i", include])
    for item in extra_vars:
        cmd.extend(["-v", item])
    cmd.append(suite)

    print(f"[parallel] start {platform} ({environment}) → {output_dir}", flush=True)
    print(f"[parallel] {' '.join(cmd)}", flush=True)
    completed = subprocess.run(cmd, cwd=_repo_root())
    results[platform] = completed.returncode
    status = "OK" if completed.returncode == 0 else f"FAIL({completed.returncode})"
    print(f"[parallel] done  {platform} → {status}", flush=True)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Executa Android e iOS em paralelo (mesma suite Robot)."
    )
    parser.add_argument(
        "--env",
        choices=("local", "bs"),
        default="bs",
        help="ENVIRONMENT local ou bs (default: bs)",
    )
    parser.add_argument(
        "--include",
        "-i",
        default=None,
        help="Tag Robot (-i). Ex.: acesso, regressivo",
    )
    parser.add_argument(
        "--suite",
        default="robot/tests/",
        help="Caminho da suite (arquivo ou pasta). Default: robot/tests/",
    )
    parser.add_argument(
        "--platforms",
        default="android,ios",
        help="Lista separada por vírgula. Default: android,ios",
    )
    parser.add_argument(
        "--var",
        action="append",
        default=[],
        help="Variável extra -v NAME:value (repetível)",
    )
    args = parser.parse_args(argv)

    platforms = [p.strip().lower() for p in args.platforms.split(",") if p.strip()]
    if not platforms:
        raise SystemExit("Informe ao menos uma plataforma em --platforms")

    robot = _which_robot()
    root = _repo_root()
    base_out = root / "logs" / "parallel" / args.env
    results: dict[str, int] = {}
    threads: list[threading.Thread] = []

    for platform in platforms:
        out = base_out / platform
        t = threading.Thread(
            target=_run_platform,
            kwargs={
                "robot": robot,
                "platform": platform,
                "environment": args.env,
                "include": args.include,
                "suite": args.suite,
                "output_dir": out,
                "extra_vars": args.var,
                "results": results,
            },
            daemon=False,
        )
        threads.append(t)
        t.start()

    for t in threads:
        t.join()

    print("\n[parallel] resumo:", flush=True)
    exit_code = 0
    for platform in platforms:
        code = results.get(platform, 1)
        print(f"  - {platform}: exit {code}  logs → logs/parallel/{args.env}/{platform}", flush=True)
        if code != 0:
            exit_code = code if exit_code == 0 else max(exit_code, code)

    if exit_code != 0:
        print("[parallel] falha em ao menos uma plataforma", flush=True)
    else:
        print("[parallel] todas as plataformas OK", flush=True)
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
