import 'package:flutter/material.dart';
import 'package:tekno_expo/utils/storage_service.dart';
import 'navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/token.dart';
import 'screen/login.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await StorageService().init();
  final String? accessToken = sharedPreferences.getString('access_token');
  if (accessToken != null && Token.checkTokenExpired(accessToken) == false) {
    runApp(const MyApp(isAuthenticated: true));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  final bool _isAuthenticated;

  const MyApp({super.key, bool isAuthenticated = false})
      : _isAuthenticated = isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
      home: _isAuthenticated ? NavBar() : LoginPage(),
    );
  }
}
