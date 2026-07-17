"""Launcher Windows-friendly para upload BrowserStack.

Use (sem -m):
  python scripts/bs_upload_app.py --file C:\\path\\app.apk --platform android --update-env

Nao use: python -m resource/tools/bs_upload_app.py
"""

from __future__ import annotations

import runpy
import sys
from pathlib import Path

_TARGET = Path(__file__).resolve().parents[1] / "resource" / "tools" / "bs_upload_app.py"

if not _TARGET.is_file():
    sys.exit(f"Script nao encontrado: {_TARGET}")

sys.argv[0] = str(_TARGET)
runpy.run_path(str(_TARGET), run_name="__main__")
