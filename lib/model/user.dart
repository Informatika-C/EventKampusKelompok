import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/token.dart';
import 'package:tekno_expo/utils/url.dart';

class User {
  String? username;
  String? email;
  String? role;
  String? nama;
  String? npm;
  String? noHp;

  User({
    this.username,
    this.email,
    this.role,
    this.nama,
    this.npm,
    this.noHp,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      role: json['role'],
      nama: json['nama'],
      npm: json['npm'],
      noHp: json['no_hp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'role': role,
      'nama': nama,
      'npm': npm,
      'no_hp': noHp,
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

  static Future<bool> updateName(String nama) async {
    String? accessToken = await Token.getToken();
    if (accessToken == null) {
      throw Exception('Token is null');
    }

    final url = Uri.parse('${URL.BASE_URL}user/update-name');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'nama': nama,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Gagal update data');
    }
  }

  static Future<bool> updateEmail(String email) async {
    String? accessToken = await Token.getToken();
    if (accessToken == null) {
      throw Exception('Token is null');
    }

    final url = Uri.parse('${URL.BASE_URL}user/update-email');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'email': email,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Gagal update data');
    }
  }

  static Future<bool> updateNPM(String npm) async {
    String? accessToken = await Token.getToken();
    if (accessToken == null) {
      throw Exception('Token is null');
    }

    final url = Uri.parse('${URL.BASE_URL}user/update-npm');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'npm': npm,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Gagal update data');
    }
  }

  static Future<bool> updatePhone(String phone) async {
    String? accessToken = await Token.getToken();
    if (accessToken == null) {
      throw Exception('Token is null');
    }

    final url = Uri.parse('${URL.BASE_URL}user/update-phone');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'no_hp': phone,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Gagal update data');
    }
  }

  static Future<bool> updatePassword(
      String password, String passwordConfirmation) async {
    String? accessToken = await Token.getToken();
    if (accessToken == null) {
      throw Exception('Token is null');
    }

    final url = Uri.parse('${URL.BASE_URL}user/update-password');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return true;
    } else {
      throw Exception('Gagal update data');
    }
  }
}
