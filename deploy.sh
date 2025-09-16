#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/home/ivan/djangoServer"
VENV="/home/ivan/env/md"
PY="$VENV/bin/python"
PIP="$VENV/bin/pip"

cd "$APP_DIR"

# 1) Get latest code
git fetch --prune
git checkout main
git pull --ff-only origin main

# 2) Dependencies
$PIP install -r requirements.txt

# 3) Django housekeeping
$PY manage.py migrate --noinput
$PY manage.py collectstatic --noinput

# 4) Graceful app reload (uWSGI touch-reload)
touch /run/uwsgi/djangoServer.reload

echo "Deploy OK"

