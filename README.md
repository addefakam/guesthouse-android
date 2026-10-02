# ════════════════════════════════════════════════════════════════════
# Guesthouse Manager — Android App (Capacitor)
# ════════════════════════════════════════════════════════════════════
#
# This project wraps your existing Operator Mobile App (/m route) into
# a native Android app that can be published to the Google Play Store.
#
# The Android app loads your Vercel deployment directly — so it looks
# EXACTLY like your mobile web app. Same tabs, same colors, same layout.
# Any changes you deploy to Vercel are instantly reflected (no Play
# Store update needed for web changes).
#
# ════════════════════════════════════════════════════════════════════
# PREREQUISITES
# ════════════════════════════════════════════════════════════════════
#
# 1. Node.js 18+ installed      → https://nodejs.org
# 2. Android Studio installed   → https://developer.android.com/studio
# 3. Java JDK 17 (bundled with Android Studio)
# 4. Your Vercel app URL (e.g. https://your-app.vercel.app)
#
# ════════════════════════════════════════════════════════════════════
# STEP-BY-STEP GUIDE
# ════════════════════════════════════════════════════════════════════
#
# ── Step 1: Update the Vercel URL ──
#
# Open capacitor.config.ts and replace YOUR-VERCEL-APP-URL with your
# actual Vercel deployment URL:
#
#   server: {
#     url: 'https://your-actual-app.vercel.app/m',
#   }
#
# ── Step 2: Install dependencies ──
#
#   cd /path/to/guesthouse-android
#   npm install
#
# ── Step 3: Create the native Android project ──
#
#   npx cap add android
#
# This creates the android/ folder with the native project.
# The AndroidManifest.xml, strings.xml, and styles.xml I created
# will be merged into the native project.
#
# ── Step 4: Sync web assets + plugins ──
#
#   npx cap sync android
#
# ── Step 5: Test on a real phone ──
#
#   a) Enable USB debugging on your Android phone:
#      Settings → About phone → tap "Build number" 7 times
#      Settings → Developer options → USB debugging → ON
#
#   b) Connect phone via USB cable
#
#   c) Run:
#      npx cap run android
#
#      Or open in Android Studio:
#      npx cap open android
#      Then click the green ▶️ "Run" button
#
# Your app launches on the phone! It loads your Vercel /m route
# inside a native Android shell.
#
# ── Step 6: Generate app icons ──
#
#   a) Create a 1024×1024 PNG icon
#   b) Save as: assets/icon.png
#   c) Run:
#      npx @capacitor/assets generate --android
#
# This generates all required icon sizes in android/app/src/main/res/
#
# ── Step 7: Generate signing keystore ──
#
#   keytool -genkey -v -keystore release.keystore \
#     -alias guesthouse -keyalg RSA -keysize 2048 -validity 10000
#
# Enter:
#   Keystore password: [STRONG PASSWORD — SAVE THIS!]
#   First and last name: Your Name
#   Organization: Your Company
#   City: Bishoftu
#   State: Oromia
#   Country code: ET
#
# ⚠️ SAVE the keystore file + password in a SECURE location!
#    If you lose this, you can NEVER update your app on Play Store.
#
# ── Step 8: Configure signing ──
#
# Open android/app/build.gradle and uncomment the signingConfigs block.
# Replace YOUR_KEYSTORE_PASSWORD and YOUR_KEY_PASSWORD with your
# actual passwords.
#
# ── Step 9: Build the AAB ──
#
#   bash build-android.sh
#
# Or manually:
#   npx cap sync android
#   cd android
#   ./gradlew bundleRelease
#   cd ..
#
# Output: android/app/build/outputs/bundle/release/app-release.aab
#
# ── Step 10: Create Play Store account ──
#
#   1. Go to: https://play.google.com/console/signup
#   2. Pay $25 one-time fee
#   3. Complete developer registration
#
# ── Step 11: Upload to Play Store ──
#
#   1. Go to: https://play.google.com/console
#   2. Click "Create app"
#   3. App name: Guesthouse Manager
#   4. Language: English
#   5. App type: App
#   6. Pricing: Free
#   7. Go to "Setup → App integrity" → upload app-release.aab
#   8. Go to "Store listing" → fill details (see play-store-listing.txt)
#   9. Go to "App content" → fill privacy policy, content rating
#  10. Click "Review release" → "Start rollout to Production"
#
# ── Step 12: Wait for Google review ──
#
#   Google reviews new apps in 1-7 days (usually 2-3 days)
#   You'll get an email when approved.
#
# ════════════════════════════════════════════════════════════════════
# PROJECT STRUCTURE
# ════════════════════════════════════════════════════════════════════
#
# guesthouse-android/
# ├── capacitor.config.ts          ← Main config (Vercel URL, plugins)
# ├── package.json                  ← Capacitor dependencies
# ├── build-android.sh              ← Build script
# ├── release.keystore              ← Signing key (generate in Step 7)
# ├── assets/
# │   └── icon.png                  ← 1024×1024 app icon (create in Step 6)
# ├── android/                       ← Native Android project (created Step 3)
# │   └── app/
#       ├── src/main/
#       │   ├── AndroidManifest.xml  ← Permissions + activity config
#       │   ├── res/
#       │   │   ├── values/strings.xml  ← App name
#       │   │   ├── values/styles.xml   ← Theme colors
#       │   │   └── mipmap-*/           ← App icons (generated Step 6)
#       │   └── google-services.json    ← FCM config (optional)
#       └── build.gradle              ← Build + signing config
# ├── play-store-listing.txt         ← Play Store description text
# ├── privacy-policy.html            ← Privacy policy (required by Google)
# └── README.md                      ← This file
#
# ════════════════════════════════════════════════════════════════════
# HOW UPDATES WORK
# ════════════════════════════════════════════════════════════════════
#
# Web app changes (UI, features, bug fixes):
#   → Deploy to Vercel → Android app picks up automatically
#   → NO Play Store update needed
#
# Native changes (icons, app name, new native plugins):
#   → Update this project → rebuild AAB → upload to Play Store
#   → Play Store review (1-7 days)
#
# ════════════════════════════════════════════════════════════════════
