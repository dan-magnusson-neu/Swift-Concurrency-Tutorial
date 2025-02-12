#!/bin/bash

set -e  # Exit if any command fails

# Define variables
TARGET_NAME="ConcurrencyTutorial" # Change this to your Swift package or Xcode target name
ARCHIVE_NAME="Documentation.doccarchive"
OUTPUT_DIR="docs"
REPO_NAME="Swift-Concurrency-Tutorial"

# 1️⃣ Build DocC documentation using Xcode
echo "🛠 Building DocC documentation..."
xcodebuild docbuild -scheme "$TARGET_NAME" -derivedDataPath .build

# 2️⃣ Find and export the `.doccarchive`
echo "📦 Exporting .doccarchive..."
DOC_ARCHIVE_PATH=$(find .build -name "$ARCHIVE_NAME" | head -n 1)
if [ -z "$DOC_ARCHIVE_PATH" ]; then
    echo "❌ Error: Could not find $ARCHIVE_NAME"
    exit 1
fi

# 3️⃣ Convert `.doccarchive` for GitHub Pages
echo "📂 Transforming for static hosting..."
rm -rf "$OUTPUT_DIR"
xcrun docc process-archive transform-for-static-hosting "$DOC_ARCHIVE_PATH" \
    --output-path "$OUTPUT_DIR" \
    --hosting-base-path "$REPO_NAME"
