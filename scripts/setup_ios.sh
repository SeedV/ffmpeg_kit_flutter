#!/bin/bash

# Download and unzip iOS xcframeworks
IOS_URL="https://github.com/SeedV/ffmpeg_kit_flutter/releases/download/v8.0.0-min/ffmpeg-kit-ios-min-8.0.0.zip"
mkdir -p Frameworks
curl -L "$IOS_URL" -o frameworks.zip
TMP_DIR=$(mktemp -d)
unzip -o frameworks.zip -d "$TMP_DIR"
cp -R "$TMP_DIR"/bundle-apple-xcframework-ios/*.xcframework Frameworks/
rm -rf "$TMP_DIR"
rm frameworks.zip
