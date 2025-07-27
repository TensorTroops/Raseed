#!/bin/bash

# Cloud Run deployment script for Raseed Backend using GitHub + Base64 credentials

# Configuration
PROJECT_ID="epic-history-237439072895"  # Your actual project ID
SERVICE_NAME="raseed-backend"
REGION="asia-south1"  # Changed to match your screenshot
GITHUB_REPO="suganth07/Raseed-Backend"  # Your GitHub repo
BRANCH="main"  # or your main branch name

echo "🚀 Deploying Raseed Backend to Google Cloud Run via GitHub"
echo "Project: ${PROJECT_ID}"
echo "Service: ${SERVICE_NAME}"
echo "Region: ${REGION}"
echo "GitHub Repo: ${GITHUB_REPO}"

# Deploy directly from GitHub with base64 credentials
echo "🌟 Deploying from GitHub repository with base64 credentials..."
gcloud run deploy ${SERVICE_NAME} 
  --source https://github.com/${GITHUB_REPO} 
  --platform managed 
  --region ${REGION} 
  --allow-unauthenticated 
  --memory 2Gi 
  --cpu 2 
  --timeout 300 
  --concurrency 80 
  --max-instances 10 
  --set-env-vars="DEBUG=false" 
  --set-env-vars="API_HOST=0.0.0.0" 
  --set-env-vars="API_PORT=8080" 
  --set-env-vars="ALLOWED_ORIGINS=*" 
  --set-env-vars="GOOGLE_CLOUD_PROJECT_ID=${PROJECT_ID}" 
  --set-env-vars="RASEED_DOCUMENT_AI_KEY_BASE64=ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAicmFzZWVkLWJhY2tlbmQtMjAyNSIsCiAgInByaXZhdGVfa2V5X2lkIjogIjRjNGMwNTJjMTUyMzU2ZjI1NzY5ZmUwMjI3YjNjNDY0NDg0ZjgwMzkiLAogICJwcml2YXRlX2tleSI6ICItLS0tLUJFR0lOIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUVxCkVlYWROQlJKT2V6OUlcblV4MGgyWWVva0NVemNEK2dnckdoeHArOFhDejd5SnVyeOVpaYW9KL0xsdm0zSmYvMmROakpRd2lwTjdiRzhvZWhcbk1OZG9tOXpCby9YYnpENVVPTXpWUDNjVmJZUTZJZlZQSHlpcmtnYnVERGVPaTJocVNSYmVhUU1pb0JKLa0JFZjBcbllNc1NKb3M0SGhGTFlWeEN4Q3ZjNXZNRkFwUnJwZDJqengrSnhNOE5BL20zd205S0ZEd0FCbFRlVENzS2llVDJcbjhMRHV5aVBoekN4UWRSU1JrUEo0dRjhCblMydXNibWNXV2RCYW5TbEJFeEtWSEloWTRURDNHSlhpT040YWthUGJcbjg2SngyVmF1TmQwcnF1WXp4dnE4MHByYVBtMGM1NWdSQXB6cTVqaGlPWkxkKzY4YWNtSDRRdUZBK1BncTIzNUFcbkNIT0xnaDZ2QWdNQkFBRUNnZ0VBQnlUOVpaVlhkLzRXdUl..." 
  --set-env-vars="RASEED_FIREBASE_KEY_BASE64=ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAic[truncated]" 
  --set-env-vars="RASEED_WALLET_SERVICE_ACCOUNT_BASE64=ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2pl[truncated]" 
  --project ${PROJECT_ID}

echo ""
echo "⚠️  IMPORTANT: You still need to set these API keys manually in Cloud Run console:"
echo "   - GEMINI_API_KEY"
echo "   - DOCUMENT_AI_PROCESSOR_ID" 
echo "   - GOOGLE_WALLET_ISSUER_ID"
echo ""

# Get the service URL
SERVICE_URL=$(gcloud run services describe ${SERVICE_NAME} --region=${REGION} --format='value(status.url)' --project=${PROJECT_ID})

echo "✅ Deployment complete!"
echo "🌐 Service URL: ${SERVICE_URL}"
echo "📚 API Documentation: ${SERVICE_URL}/docs"
echo "🏥 Health Check: ${SERVICE_URL}/health"

# Optional: Set up custom domain (uncomment if needed)
# echo "🔗 Setting up custom domain..."
# gcloud run domain-mappings create --service ${SERVICE_NAME} --domain your-domain.com --region ${REGION} --project ${PROJECT_ID}
