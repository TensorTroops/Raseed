#!/bin/bash

# Environment Variables Setup Script for Cloud Run
# Copy these environment variables to your Cloud Run service

echo "🔐 Environment Variables for Google Cloud Run Deployment"
echo "======================================================="
echo ""

echo "## Required Environment Variables:"
echo ""

echo "# Project Configuration"
echo "GOOGLE_CLOUD_PROJECT_ID=epic-history-237439072895"
echo ""

echo "# Base64 Encoded Credentials (from the terminal output above)"
echo "RASEED_DOCUMENT_AI_KEY_BASE64=ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAicmFzZWVkLWJhY2tlbmQtMjAyNSIsCiAgInByaXZhdGVfa2V5X2lkIjogIjRjNGMwNTJjMTUyMzU2ZjI1NzY5ZmUwMjI3YjNjNDY0NDg0ZjgwMzkiLAogICJwcml2YXRlX2tleSI6ICItLS0tLUJFR0lOIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUVxCkVlYWROQlJ...truncated"
echo ""

echo "RASEED_FIREBASE_KEY_BASE64=ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAicmFzZWVkLWFpLWJhY2tlbmQiLAogICJwcml2YXRlX2tleV9pZCI6ICJlODE0ZGJkNDEzMGIwZGMwNjRlN2Y5ZmRmNDkwODYwN2M3YjU...truncated"
echo ""

echo "RASEED_WALLET_SERVICE_ACCOUNT_BASE64=ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAicmFzZWVkLWJhY2tlbmQtMjAyNSIsCiAgInByaXZhdGVfa2V5X2lkIjogImY5MDk4NzFiNmQwNDA5OTFiZjliYzZkODExNmQ4NWNhMDJkNjMyMDIiLAog...truncated"
echo ""

echo "# API Keys (you need to provide these)"
echo "GEMINI_API_KEY=your-gemini-api-key-here"
echo "DOCUMENT_AI_PROCESSOR_ID=your-document-ai-processor-id-here"
echo "GOOGLE_WALLET_ISSUER_ID=your-wallet-issuer-id-here"
echo ""

echo "# Application Configuration"
echo "DEBUG=false"
echo "API_HOST=0.0.0.0" 
echo "API_PORT=8080"
echo "ALLOWED_ORIGINS=*"
echo ""

echo "======================================================="
echo "📋 How to set these in Cloud Run:"
echo "1. Go to Google Cloud Console → Cloud Run"
echo "2. Select your service → Edit & Deploy New Revision"
echo "3. Go to 'Variables & Secrets' tab"
echo "4. Add each environment variable above"
echo "5. Deploy the revision"
echo ""

echo "🚨 Important: Replace the 'your-*-here' values with your actual API keys!"
