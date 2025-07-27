# Raseed Backend Deployment to Google Cloud Run (GitHub Integration)

## Prerequisites

1. **Google Cloud SDK installed**
2. **GitHub repository**: https://github.com/suganth07/Raseed-Backend.git
3. **Google Cloud Project set up**

## Deployment Methods

### Method 1: Direct GitHub Deployment (Easiest)

```bash
# 1. Set your project ID in deploy.sh
nano deploy.sh
# Change PROJECT_ID="your-gcp-project-id" to your actual project ID

# 2. Make script executable and run
chmod +x deploy.sh
./deploy.sh
```

This method pulls directly from GitHub and builds in Cloud Build automatically.

### Method 2: Using Credentials Securely

#### Option A: Google Secret Manager (Production Recommended)

1. **Store credentials in Secret Manager:**
```bash
# Make setup script executable
chmod +x setup-secrets.sh

# Edit with your project ID
nano setup-secrets.sh

# Run to store all credentials
./setup-secrets.sh
```

2. **Deploy with Secret Manager:**
```bash
gcloud run deploy raseed-backend \
  --source https://github.com/suganth07/Raseed-Backend \
  --region us-central1 \
  --allow-unauthenticated \
  --memory 2Gi \
  --set-env-vars="GOOGLE_CLOUD_PROJECT_ID=your-project-id" \
  --set-env-vars="USE_SECRET_MANAGER=true"
```

#### Option B: Environment Variables (Simple)

```bash
gcloud run deploy raseed-backend \
  --source https://github.com/suganth07/Raseed-Backend \
  --region us-central1 \
  --allow-unauthenticated \
  --memory 2Gi \
  --set-env-vars="GOOGLE_CLOUD_PROJECT_ID=your-project-id" \
  --set-env-vars="GEMINI_API_KEY=your-gemini-key" \
  --set-env-vars="DOCUMENT_AI_PROCESSOR_ID=your-processor-id"
```

## What happens without credential files:

1. **Local Development**: 
   - Keep credential files in your local Backend folder
   - Add them to .gitignore (already done)
   - Use .env file for API keys

2. **Production Deployment**:
   - **Option A**: Use Google Secret Manager (most secure)
   - **Option B**: Use environment variables in Cloud Run
   - **Option C**: Use Cloud Run's default service account (automatic)
