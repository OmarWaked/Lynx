#!/bin/bash

# Firebase Auto-Setup Script for Lynx App
# This script will automatically set up your Firebase project

echo "🔥 Firebase Auto-Setup Script for Lynx App"
echo "=========================================="
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3 first."
    echo "   Visit: https://www.python.org/downloads/"
    exit 1
fi

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "❌ Google Cloud SDK is not installed."
    echo "   Installing Google Cloud SDK..."
    echo "   Visit: https://cloud.google.com/sdk/docs/install"
    echo ""
    echo "   Or install via Homebrew (macOS):"
    echo "   brew install --cask google-cloud-sdk"
    exit 1
fi

# Check if user is authenticated with gcloud
echo "🔐 Checking Google Cloud authentication..."
if ! gcloud auth list --filter=status:ACTIVE --format=value(account) | grep -q .; then
    echo "⚠️  Not authenticated with Google Cloud. Please login:"
    echo "   gcloud auth login"
    echo ""
    echo "   Then set your project:"
    echo "   gcloud config set project lynx-waked"
    exit 1
fi

# Get current project
CURRENT_PROJECT=$(gcloud config get-value project)
echo "✅ Authenticated with Google Cloud"
echo "📱 Current project: $CURRENT_PROJECT"

# Check if project is set to lynx-waked
if [ "$CURRENT_PROJECT" != "lynx-waked" ]; then
    echo "⚠️  Project is not set to 'lynx-waked'"
    echo "   Setting project to lynx-waked..."
    gcloud config set project lynx-waked
    echo "✅ Project set to lynx-waked"
fi

# Install required Python packages
echo ""
echo "📦 Installing required Python packages..."
pip3 install firebase-admin

# Run the Python setup script
echo ""
echo "🚀 Running Firebase setup..."
python3 setup_firebase.py

# Check if setup was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Setup completed successfully!"
    echo ""
    echo "📋 Next steps:"
    echo "1. Open the Lynx app in Xcode"
    echo "2. Build and run the app"
    echo "3. Check the console for Firebase success messages"
    echo "4. Navigate to Admin Panel → Test Firebase Services"
    echo ""
    echo "🔒 Don't forget to set security rules in Firebase Console:"
    echo "   - Go to Firestore → Rules"
    echo "   - Go to Storage → Rules"
    echo "   - Use the rules from FIREBASE_CONSOLE_SETUP.md"
else
    echo ""
    echo "❌ Setup failed. Please check the errors above."
    exit 1
fi
