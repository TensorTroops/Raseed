import os
import json
from google.cloud import secretmanager
from typing import Dict, Any

class SecretManager:
    """Handle Google Secret Manager integration for credentials"""
    
    def __init__(self, project_id: str = None):
        self.project_id = project_id or os.getenv('GOOGLE_CLOUD_PROJECT_ID')
        self.client = secretmanager.SecretManagerServiceClient()
        
    def get_secret(self, secret_name: str) -> str:
        """Get secret value from Secret Manager"""
        try:
            name = f"projects/{self.project_id}/secrets/{secret_name}/versions/latest"
            response = self.client.access_secret_version(request={"name": name})
            return response.payload.data.decode("UTF-8")
        except Exception as e:
            print(f"Error accessing secret {secret_name}: {e}")
            return None
    
    def get_json_secret(self, secret_name: str) -> Dict[Any, Any]:
        """Get JSON secret and parse it"""
        secret_value = self.get_secret(secret_name)
        if secret_value:
            return json.loads(secret_value)
        return {}

# Global secret manager instance
secret_manager = SecretManager()

def get_service_account_credentials(secret_name: str) -> Dict[Any, Any]:
    """Get service account credentials from Secret Manager"""
    if os.getenv('DEBUG') == 'true':
        # For local development, use local files
        try:
            with open(f"{secret_name}.json", 'r') as f:
                return json.load(f)
        except FileNotFoundError:
            print(f"Local credential file {secret_name}.json not found")
            return {}
    else:
        # For production, use Secret Manager
        return secret_manager.get_json_secret(secret_name)

def get_gemini_api_key() -> str:
    """Get Gemini API key from Secret Manager or environment"""
    # Try environment variable first (for local dev)
    api_key = os.getenv('GEMINI_API_KEY')
    if api_key:
        return api_key
    
    # Fallback to Secret Manager (for production)
    return secret_manager.get_secret('gemini-api-key')
