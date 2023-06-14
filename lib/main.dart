import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tekno_expo/utils/storage_service.dart';
import 'package:tekno_expo/utils/url.dart';
import 'navbar.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await StorageService().init();
  final String? accessToken = sharedPreferences.getString('access_token');
  if (accessToken != null) {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
      initialRoute: _isAuthenticated ? '/home' : '/login',
      routes: {
        '/home': (context) => NavBar(),
        '/login': (context) => LoginPage(),
        // '/signup': (context) => SignUpPage(),
        // tambahkan rute untuk halaman lainnya
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginForm = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void toggleForm() {
    setState(() {
      isLoginForm = !isLoginForm;
    });
  }

  void navigateToPage(String route) {
    if (route == '/home') {
      Navigator.pushReplacementNamed(context, route);
    } else {
      toggleForm();
    }
  }

  void login() async {
    final url = Uri.parse('${URL.BASE_URL}auth/login');
    final body = {
      'email': _emailController.text,
      'password': _passwordController.text
    };
    try {
      final response = await http.post(
        url,
        body: body,
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final SharedPreferences sharedPref = await StorageService().init();
        final bool result =
            await sharedPref.setString('access_token', data['access_token']);
        if (result == true) navigateToPage('/home');
      } else {
        Fluttertoast.showToast(
          msg: data.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Login gagal',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0b2b76),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: <Color>[
              Color(0xFF001431),
              Color(0xFF0b2b76),
            ],
          ),
        ),
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.65,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 8,
                      blurRadius: 15,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              isLoginForm ? 'Login' : 'Sign Up',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 70),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                              ),
                            ),
                            if (!isLoginForm)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                ),
                              ),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (isLoginForm) {
                                  final result = login();
                                  navigateToPage('/home');
                                } else {
                                  navigateToPage('/login');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16), // Mengatur padding vertikal
                                minimumSize: const Size(double.infinity,
                                    48), // Mengatur ukuran minimum
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Mengatur sudut melengkung pada tombol
                                ),
                                // Menambahkan gaya tambahan menggunakan tambahan properti
                                backgroundColor: Colors.blue,
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                elevation: 4,
                              ),
                              child: Text(isLoginForm ? 'Login' : 'Sign Up'),
                            ),
                            const SizedBox(height: 70),
                            TextButton(
                              onPressed: () {
                                navigateToPage('/login');
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: isLoginForm
                                      ? 'Belum Punya akun? '
                                      : 'Sudah punya akun? ',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: isLoginForm ? 'Sign Up' : 'Login',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
