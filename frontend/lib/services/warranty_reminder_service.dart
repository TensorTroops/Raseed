import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../config/api_config.dart';

class WarrantyReminderService {
  static const String _baseUrl = ApiConfig.baseUrl;
  
  /// Create calendar reminders for all warranties expiring soon
  static Future<Map<String, dynamic>> createAllWarrantyReminders(String userId) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/warranty-reminders/create-all/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create warranty reminders: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating warranty reminders: $e');
      }
      throw Exception('Error creating warranty reminders: $e');
    }
  }

  /// Test creating warranty reminders without OAuth (for testing)
  static Future<Map<String, dynamic>> testCreateAllWarrantyReminders(String userId) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/warranty-reminders/create-all-test/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to test warranty reminders: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error testing warranty reminders: $e');
      }
      throw Exception('Error testing warranty reminders: $e');
    }
  }

  /// Get warranty products with expiry information for display
  static Future<List<Map<String, dynamic>>> getWarrantyProducts(String userId) async {
    try {
      // URL encode the user ID to handle email addresses properly
      final encodedUserId = Uri.encodeComponent(userId);
      final response = await http.get(
        Uri.parse('$_baseUrl/warranty-reminders/warranty-products/$encodedUserId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['warranty_products'] ?? []);
      } else {
        throw Exception('Failed to get warranty products: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting warranty products: $e');
      }
      throw Exception('Error getting warranty products: $e');
    }
  }

  /// Create a single warranty reminder for a specific product
  static Future<Map<String, dynamic>> createSingleWarrantyReminder(String userId, String productName) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/warranty-reminders/create-single/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'product_name': productName,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create single reminder: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating single reminder: $e');
      }
      throw Exception('Error creating single reminder: $e');
    }
  }

  /// Get upcoming warranty reminders
  static Future<List<Map<String, dynamic>>> getUpcomingWarrantyReminders(String userId) async {
    try {
      // URL encode the user ID to handle email addresses properly
      final encodedUserId = Uri.encodeComponent(userId);
      final response = await http.get(
        Uri.parse('$_baseUrl/warranty-reminders/upcoming/?user_id=$encodedUserId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['reminders'] ?? []);
      } else {
        throw Exception('Failed to get upcoming reminders: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting upcoming reminders: $e');
      }
      throw Exception('Error getting upcoming reminders: $e');
    }
  }

  /// Check the health of the warranty reminder service
  static Future<bool> checkServiceHealth() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/warranty-reminders/health'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('Warranty reminder service health check failed: $e');
      }
      return false;
    }
  }
}
