#!/bin/bash

# Download and unzip macOS frameworks from GitHub Release
MACOS_URL="https://github.com/SeedV/ffmpeg_kit_flutter/releases/download/v8.0.0-min/ffmpeg-kit-macos-min-8.0.0.zip"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MACOS_DIR="${SCRIPT_DIR}/../macos"

cd "$MACOS_DIR"
mkdir -p Frameworks
curl -L "$MACOS_URL" -o frameworks.zip
TMP_DIR=$(mktemp -d)
unzip -o frameworks.zip -d "$TMP_DIR"
cp -R "$TMP_DIR"/bundle-apple-xcframework-macos/*.framework Frameworks/
rm -rf "$TMP_DIR"
rm frameworks.zip

echo "macOS frameworks downloaded to ${MACOS_DIR}/Frameworks/"
