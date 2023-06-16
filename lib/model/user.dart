import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/token.dart';
import 'package:tekno_expo/utils/url.dart';

class User {
  String? username;
  String? email;
  String? role;

  User({
    this.username,
    this.email,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'role': role,
    };
  }

  static getUser() async {
    String? accessToken = await Token.getToken();
    if (accessToken == null) {
      throw Exception('Token is null');
    }

    final url = Uri.parse('${URL.BASE_URL}user');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
