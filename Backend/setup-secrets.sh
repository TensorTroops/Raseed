#!/bin/bash

# Script to set up Google Secret Manager for credentials
# Run this ONCE to store your credentials securely

PROJECT_ID="your-gcp-project-id"  # Replace with your actual project ID

echo "🔐 Setting up Google Secret Manager for Raseed Backend"

# Enable Secret Manager API
gcloud services enable secretmanager.googleapis.com --project=${PROJECT_ID}

# Store each credential file as a secret (run these from your local machine where you have the files)
echo "📝 Creating secrets from your local credential files..."

# Document AI key
gcloud secrets create raseed-document-ai-key \
  --data-file=raseed-document-ai-key.json \
  --project=${PROJECT_ID}

# Firebase key  
gcloud secrets create raseed-firebase-key \
  --data-file=raseed-firebase-key.json \
  --project=${PROJECT_ID}

# Wallet service account key
gcloud secrets create raseed-wallet-service-account \
  --data-file=raseed-wallet-service-account.json \
  --project=${PROJECT_ID}

# Gemini API key (create this manually in Secret Manager console)
echo "🔑 Please create 'gemini-api-key' secret manually in console with your API key"

# Grant Cloud Run service account access to secrets
SERVICE_ACCOUNT="raseed-backend@${PROJECT_ID}.iam.gserviceaccount.com"

gcloud secrets add-iam-policy-binding raseed-document-ai-key \
  --member="serviceAccount:${SERVICE_ACCOUNT}" \
  --role="roles/secretmanager.secretAccessor" \
  --project=${PROJECT_ID}

gcloud secrets add-iam-policy-binding raseed-firebase-key \
  --member="serviceAccount:${SERVICE_ACCOUNT}" \
  --role="roles/secretmanager.secretAccessor" \
  --project=${PROJECT_ID}

gcloud secrets add-iam-policy-binding raseed-wallet-service-account \
  --member="serviceAccount:${SERVICE_ACCOUNT}" \
  --role="roles/secretmanager.secretAccessor" \
  --project=${PROJECT_ID}

echo "✅ Secret Manager setup complete!"
echo "🚀 Now you can deploy using deploy.sh"
