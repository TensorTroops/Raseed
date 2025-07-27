from typing import Optional
from pydantic_settings import BaseSettings
from pydantic import Field


class Settings(BaseSettings):
    # Google Cloud Configuration
    google_cloud_project_id: str = Field(..., env="GOOGLE_CLOUD_PROJECT_ID")
    google_cloud_location: str = Field(default="us", env="GOOGLE_CLOUD_LOCATION")
    document_ai_processor_id: str = Field(..., env="DOCUMENT_AI_PROCESSOR_ID")
    
    # Base64 encoded credentials (from environment variables)
    raseed_document_ai_key_base64: Optional[str] = Field(None, env="RASEED_DOCUMENT_AI_KEY_BASE64")
    raseed_firebase_key_base64: Optional[str] = Field(None, env="RASEED_FIREBASE_KEY_BASE64")
    raseed_wallet_service_account_base64: Optional[str] = Field(None, env="RASEED_WALLET_SERVICE_ACCOUNT_BASE64")
    
    # Legacy file paths (for local development)
    google_application_credentials: Optional[str] = Field(None, env="GOOGLE_APPLICATION_CREDENTIALS")
    
    # Gemini API Configuration
    gemini_api_key: str = Field(..., env="GEMINI_API_KEY")
    
    # Firestore Configuration
    firestore_database_id: str = Field(default="(default)", env="FIRESTORE_DATABASE_ID")
    
    # Firebase Configuration (for graph storage)
    firebase_project_id: Optional[str] = Field(None, env="FIREBASE_PROJECT_ID")
    firebase_database_url: Optional[str] = Field(None, env="FIREBASE_DATABASE_URL")
    firebase_credentials_path: Optional[str] = Field(None, env="FIREBASE_CREDENTIALS_PATH")
    
    # API Configuration
    api_host: str = Field(default="0.0.0.0", env="API_HOST")
    api_port: int = Field(default=8080, env="API_PORT")  # Changed default to 8080 for Cloud Run
    debug: bool = Field(default=False, env="DEBUG")
    
    # CORS Configuration
    allowed_origins: list[str] = Field(
        default=["*"], 
        env="ALLOWED_ORIGINS"
    )
    
    # Receipt Processing Configuration
    max_file_size: int = Field(default=10 * 1024 * 1024, env="MAX_FILE_SIZE")  # 10MB
    supported_file_types: list[str] = Field(
        default=["image/jpeg", "image/png", "image/webp", "application/pdf"],
        env="SUPPORTED_FILE_TYPES"
    )
    
    # Google Wallet Configuration
    google_wallet_issuer_id: str = Field(..., env="GOOGLE_WALLET_ISSUER_ID")
    google_wallet_service_account_file: str = Field(
        default="raseed-wallet-service-account.json", 
        env="GOOGLE_WALLET_SERVICE_ACCOUNT_FILE"
    )
    
    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"


# Global settings instance
settings = Settings()