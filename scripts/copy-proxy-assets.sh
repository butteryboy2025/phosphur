#!/usr/bin/env bash
# Copies the Ultraviolet/Epoxy/Bare-mux client assets that src/index.js
# normally serves at runtime via express.static() into public/, since
# Netlify publishes a static folder and never runs src/index.js.
set -euo pipefail

cd "$(dirname "$0")/.."

mkdir -p public/uv public/epoxy public/baremux

for f in node_modules/@titaniumnetwork-dev/ultraviolet/dist/*; do
  base="$(basename "$f")"
  # public/uv/uv.config.js is a hand-written override; never replace it.
  [ "$base" = "uv.config.js" ] && continue
  cp "$f" "public/uv/$base"
done

cp node_modules/@mercuryworkshop/epoxy-transport/dist/* public/epoxy/
cp node_modules/@mercuryworkshop/bare-mux/dist/* public/baremux/
