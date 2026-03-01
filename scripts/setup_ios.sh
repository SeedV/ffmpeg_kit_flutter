#!/bin/bash

# Download and unzip iOS xcframeworks from GitHub Release
IOS_URL="https://github.com/SeedV/ffmpeg_kit_flutter/releases/download/v8.0.0-min/ffmpeg-kit-ios-min-8.0.0.zip"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IOS_DIR="${SCRIPT_DIR}/../ios"

cd "$IOS_DIR"
mkdir -p Frameworks
curl -L "$IOS_URL" -o frameworks.zip
TMP_DIR=$(mktemp -d)
unzip -o frameworks.zip -d "$TMP_DIR"
cp -R "$TMP_DIR"/bundle-apple-xcframework-ios/*.xcframework Frameworks/
rm -rf "$TMP_DIR"
rm frameworks.zip

echo "iOS frameworks downloaded to ${IOS_DIR}/Frameworks/"
