import os
import json
import base64
from typing import Dict, Any, Optional
import logging

logger = logging.getLogger(__name__)

class CredentialsManager:
    """Manage base64 encoded credentials from environment variables"""
    
    @staticmethod
    def decode_base64_json(env_var_name: str) -> Optional[Dict[Any, Any]]:
        """
        Decode base64 encoded JSON from environment variable
        
        Args:
            env_var_name: Name of environment variable containing base64 encoded JSON
            
        Returns:
            Decoded JSON as dictionary or None if not found/invalid
        """
        try:
            base64_encoded = os.getenv(env_var_name)
            if not base64_encoded:
                logger.warning(f"Environment variable {env_var_name} not found")
                return None
                
            # Decode base64
            decoded_bytes = base64.b64decode(base64_encoded)
            decoded_str = decoded_bytes.decode('utf-8')
            
            # Parse JSON
            credentials = json.loads(decoded_str)
            logger.info(f"Successfully decoded credentials from {env_var_name}")
            return credentials
            
        except Exception as e:
            logger.error(f"Failed to decode credentials from {env_var_name}: {e}")
            return None
    
    @staticmethod
    def get_document_ai_credentials() -> Optional[Dict[Any, Any]]:
        """Get Document AI service account credentials"""
        return CredentialsManager.decode_base64_json('RASEED_DOCUMENT_AI_KEY_BASE64')
    
    @staticmethod
    def get_firebase_credentials() -> Optional[Dict[Any, Any]]:
        """Get Firebase service account credentials"""
        return CredentialsManager.decode_base64_json('RASEED_FIREBASE_KEY_BASE64')
    
    @staticmethod
    def get_wallet_credentials() -> Optional[Dict[Any, Any]]:
        """Get Wallet service account credentials"""
        return CredentialsManager.decode_base64_json('RASEED_WALLET_SERVICE_ACCOUNT_BASE64')
    
    @staticmethod
    def save_temp_credentials_file(credentials: Dict[Any, Any], filename: str) -> str:
        """
        Save credentials to a temporary file for Google libraries that require file paths
        
        Args:
            credentials: Credentials dictionary
            filename: Temporary filename to create
            
        Returns:
            Path to the temporary credentials file
        """
        import tempfile
        
        # Create temporary file
        temp_dir = tempfile.gettempdir()
        temp_file_path = os.path.join(temp_dir, filename)
        
        try:
            with open(temp_file_path, 'w') as f:
                json.dump(credentials, f, indent=2)
            
            logger.info(f"Temporary credentials file created: {temp_file_path}")
            return temp_file_path
            
        except Exception as e:
            logger.error(f"Failed to create temporary credentials file: {e}")
            raise
    
    @staticmethod
    def cleanup_temp_file(file_path: str):
        """Clean up temporary credentials file"""
        try:
            if os.path.exists(file_path):
                os.remove(file_path)
                logger.info(f"Cleaned up temporary file: {file_path}")
        except Exception as e:
            logger.warning(f"Failed to cleanup temporary file {file_path}: {e}")

# Global instance
credentials_manager = CredentialsManager()
