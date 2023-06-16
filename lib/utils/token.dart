import 'dart:convert';

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
}
