import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static bool checkTokenExpired(String token) {
    final parts = token.split('.');
    final payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> payloadMap = json.decode(resp);
    final int exp = payloadMap['exp'];
    final DateTime now = DateTime.now();
    final DateTime expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return expiry.isAfter(now);
  }

  static Future<String?> getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('access_token');
    return token;
  }

  static Future<String> getRole() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('access_token');
    if (token == null) {
      return '';
    }

    final parts = token.split('.');
    final payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> payloadMap = json.decode(resp);
    final String role = payloadMap['role'];
    return role;
  }

  static Future<int> getUserId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('access_token');
    if (token == null) {
      return 0;
    }

    final parts = token.split('.');
    final payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> payloadMap = json.decode(resp);
    final int userId = payloadMap['sub'];
    return userId;
  }
}
