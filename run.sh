#!/usr/bin/env bash
# Windows 侧入口：
#   bash run.sh scripts/demo_e2e.py    跑脚本
#   bash run.sh --ui                   起本地界面（浏览器打开 http://localhost:8501）
set -euo pipefail

PROJECT="/mnt/c/Users/27981/Documents/Qoder/2026-10-27/264bdce7/relay"
TARGET="${1:-scripts/demo_e2e.py}"

if [ "$TARGET" = "--ui" ]; then
  wsl.exe -d Ubuntu -e bash -lc "cd '$PROJECT' && PYTHONUTF8=1 ~/relay-venv/bin/streamlit run app.py --server.headless true"
else
  EXTRA="${2:-}"
  wsl.exe -d Ubuntu -e bash -lc "cd '$PROJECT' && PYTHONUTF8=1 ~/relay-venv/bin/python '$TARGET' $EXTRA"
fi
