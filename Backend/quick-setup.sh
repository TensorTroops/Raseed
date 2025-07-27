#!/bin/bash

# Quick setup script for Google Cloud Run with secrets
# Run this from your local machine where you have the JSON files

PROJECT_ID="epic-history-237439072895"  # Your project ID from the screenshot

echo "🔐 Setting up credentials for Cloud Run deployment"

# Enable required APIs
echo "📡 Enabling required APIs..."
gcloud services enable secretmanager.googleapis.com --project=${PROJECT_ID}
gcloud services enable run.googleapis.com --project=${PROJECT_ID}
gcloud services enable cloudbuild.googleapis.com --project=${PROJECT_ID}

# Create secrets from your local JSON files (if they exist)
if [ -f "raseed-document-ai-key.json" ]; then
    echo "📝 Creating Document AI secret..."
    gcloud secrets create raseed-document-ai-key \
        --data-file=raseed-document-ai-key.json \
        --project=${PROJECT_ID}
fi

if [ -f "raseed-firebase-key.json" ]; then
    echo "📝 Creating Firebase secret..."
    gcloud secrets create raseed-firebase-key \
        --data-file=raseed-firebase-key.json \
        --project=${PROJECT_ID}
fi

if [ -f "raseed-wallet-service-account.json" ]; then
    echo "📝 Creating Wallet service account secret..."
    gcloud secrets create raseed-wallet-service-account \
        --data-file=raseed-wallet-service-account.json \
        --project=${PROJECT_ID}
fi

echo "✅ Secrets created! Now set environment variables in Cloud Run console:"
echo "GOOGLE_CLOUD_PROJECT_ID=${PROJECT_ID}"
echo "USE_SECRET_MANAGER=true"
echo "GEMINI_API_KEY=your-gemini-api-key"
