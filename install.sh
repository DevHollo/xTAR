#!/bin/bash

set -e

SCRIPT="bin/xtarv001.sh"
TARGET="/usr/local/bin/xtar"

if [[ ! -f "$SCRIPT" ]]; then
    echo "❌ Error: $SCRIPT not found!"
    exit 1
fi

chmod +x "$SCRIPT"

echo "🔧 Installing xTAR to $TARGET..."
sudo mv "$SCRIPT" "$TARGET"

if [[ -d "bin" && -z "$(ls -A bin)" ]]; then
    echo "🧹 Cleaning up empty 'bin' directory..."
    rmdir bin
fi

echo "✅ xTAR installed as 'xtar'. Run with: xtar --help"