#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════
# build-android.sh — Build the Android AAB for Play Store upload
#
# Run this on your machine AFTER:
#   1. Installing Android Studio
#   2. Running `npx cap add android` + `npx cap sync android`
#   3. Generating your keystore (see README)
#
# Usage:
#   cd /path/to/guesthouse-android
#   bash build-android.sh
# ════════════════════════════════════════════════════════════════════

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Guesthouse Manager — Android Build Script"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Step 1: Sync web assets + native plugins
echo ""
echo "▶ Step 1/4: Syncing Capacitor..."
npx cap sync android
echo "  ✓ Synced"

# Step 2: Build the AAB
echo ""
echo "▶ Step 2/4: Building Android App Bundle (AAB)..."
cd android
./gradlew bundleRelease --no-daemon
cd ..
echo "  ✓ Build complete"

# Step 3: Locate the output file
AAB_PATH="android/app/build/outputs/bundle/release/app-release.aab"
if [ -f "$AAB_PATH" ]; then
    echo ""
    echo "▶ Step 3/4: AAB file ready!"
    echo "  Location: $AAB_PATH"
    echo "  Size: $(du -h "$AAB_PATH" | cut -f1)"
else
    echo ""
    echo "❌ AAB not found at expected location."
    echo "  Expected: $AAB_PATH"
    echo "  Check the build output above for errors."
    exit 1
fi

# Step 4: Instructions
echo ""
echo "▶ Step 4/4: Next steps"
echo ""
echo "  1. Upload $AAB_PATH to Google Play Console"
echo "  2. Go to: https://play.google.com/console"
echo "  3. Select your app → Production → Create new release"
echo "  4. Upload the AAB file"
echo "  5. Fill in release notes"
echo "  6. Click 'Review release' → 'Start rollout to Production'"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅ Build complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
