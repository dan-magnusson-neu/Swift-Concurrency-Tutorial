#!/bin/bash

set -e  # Exit if any command fails

# Define project-specific variables
SCHEME="ConcurrencyTutorial" # Replace with your actual Xcode scheme
OUTPUT_DIR="docs"
REPO_NAME="Swift-Concurrency-Tutorial" # Change to match your GitHub repo name

# 1️⃣ Build DocC documentation using Xcode
echo "🛠 Building DocC documentation..."
xcodebuild docbuild -scheme "$SCHEME" -derivedDataPath .build > /dev/null

# 2️⃣ Find the generated .doccarchive
echo "📦 Locating .doccarchive..."
DOC_ARCHIVE_PATH=$(find .build -name "$SCHEME.doccarchive" | head -n 1)

if [ -z "$DOC_ARCHIVE_PATH" ]; then
    echo "❌ Error: Could not find .doccarchive"
    exit 1
fi
echo "✅ Found: $DOC_ARCHIVE_PATH"

# 3️⃣ Convert .doccarchive for Static Hosting
echo "📂 Transforming for static hosting..."
rm -rf "$OUTPUT_DIR"
xcrun docc process-archive transform-for-static-hosting "$DOC_ARCHIVE_PATH" \
    --output-path "$OUTPUT_DIR" \
    --hosting-base-path "$REPO_NAME"

echo "🎉 Documentation successfully generated in: $OUTPUT_DIR/"
echo "📌 You can now manually commit and push it to GitHub Pages."

