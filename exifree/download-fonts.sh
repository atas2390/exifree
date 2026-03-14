#!/bin/bash
# download-fonts.sh
# Downloads IBM Plex woff2 files for self-hosting
# Run from the repo root: bash download-fonts.sh
#
# Requires: npm (Node.js)

set -e
mkdir -p fonts

weight_name() {
  case "$1" in
    300) echo "Light" ;;
    400) echo "Regular" ;;
    500) echo "Medium" ;;
    600) echo "SemiBold" ;;
    700) echo "Bold" ;;
    800) echo "ExtraBold" ;;
  esac
}

echo "=== Downloading IBM Plex fonts ==="
echo ""

TMPDIR=$(mktemp -d)
cd "$TMPDIR"
npm init -y --silent > /dev/null 2>&1
npm install --silent @ibm/plex-sans@latest @ibm/plex-sans-hebrew@latest @ibm/plex-mono@latest 2>/dev/null
cd - > /dev/null

echo "⬇  IBM Plex Sans Hebrew (300–700)"
for w in 300 400 500 600 700; do
  NAME=$(weight_name $w)
  cp "$TMPDIR/node_modules/@ibm/plex-sans-hebrew/fonts/complete/woff2/IBMPlexSansHebrew-${NAME}.woff2" \
     "fonts/ibm-plex-sans-hebrew-${w}.woff2"
  echo "   ✓ ibm-plex-sans-hebrew-${w}.woff2"
done

echo "⬇  IBM Plex Sans (300–800)"
for w in 300 400 500 600 700 800; do
  NAME=$(weight_name $w)
  cp "$TMPDIR/node_modules/@ibm/plex-sans/fonts/complete/woff2/IBMPlexSans-${NAME}.woff2" \
     "fonts/ibm-plex-sans-${w}.woff2"
  echo "   ✓ ibm-plex-sans-${w}.woff2"
done

echo "⬇  IBM Plex Mono (400–500)"
for w in 400 500; do
  NAME=$(weight_name $w)
  cp "$TMPDIR/node_modules/@ibm/plex-mono/fonts/complete/woff2/IBMPlexMono-${NAME}.woff2" \
     "fonts/ibm-plex-mono-${w}.woff2"
  echo "   ✓ ibm-plex-mono-${w}.woff2"
done

rm -rf "$TMPDIR"

echo ""
echo "✅ Done — all font files in fonts/"
ls -lh fonts/*.woff2
