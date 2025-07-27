class ApiConfig {
  // Your actual Cloud Run service URL
  static const String baseUrl = 'https://raseed-backend-237439072895.asia-south1.run.app';
  
  // For local development, uncomment this line:
  // static const String baseUrl = 'http://localhost:8001';
  
  // API endpoints
  static const String uploadEndpoint = '/upload';
  static const String healthEndpoint = '/health';
  static const String graphsEndpoint = '/graphs';
  static const String receiptsEndpoint = '/receipts';
  static const String walletEndpoint = '/wallet';
  static const String economixEndpoint = '/economix';
  static const String warrantyEndpoint = '/warranty-products';
  
  // Request timeouts
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration uploadTimeout = Duration(minutes: 2);
}
