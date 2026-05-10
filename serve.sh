#!/usr/bin/env bash
# Serve the e-Portfolio locally as a static site.
#
# This is plain HTML/CSS/JS (FORTY by HTML5 UP), no Jekyll or Node toolchain.
# You can also just open index.html directly in a browser — file:// URLs work
# fine for FORTY because everything is static and relative.
#
# Usage:
#   ./serve.sh           # http://localhost:4000
set -euo pipefail

cd "$(dirname "$0")"

if ! docker info >/dev/null 2>&1; then
  echo "Docker daemon isn't reachable. Start Docker Desktop and re-run." >&2
  echo "(Or just open index.html directly in your browser — no server needed.)" >&2
  exit 1
fi

# python:3-alpine is ~50 MB and pulls quickly. http.server is built-in.
exec docker run --rm -it \
  -p 4000:4000 \
  -v "$(pwd):/srv:ro" \
  -w /srv \
  python:3-alpine \
  python -m http.server 4000
