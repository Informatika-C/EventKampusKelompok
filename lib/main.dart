import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'navbar.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => NavBar(),
        '/login': (context) => LoginPage(),
        // '/signup': (context) => SignUpPage(),
        // tambahkan rute untuk halaman lainnya
      },
    );
  }
}

class LoginPage extends StatefulWidget {
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
    // Mengirim HTTP GET request ke URL tertentu
    final url =
        Uri.parse('https://api-event-kampus.azurewebsites.net/auth/login');
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
        print(data['access_token']);
      } else {}
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b2b76),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: <Color>[
              Color(0xFF001431),
              Color(0xFF0b2b76),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Center(
              child: Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 8,
                      blurRadius: 15,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isLoginForm ? 'Login' : 'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 70),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                        ),
                      ),
                      if (!isLoginForm)
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 20),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 16), // Mengatur padding vertikal
                          minimumSize: Size(
                              double.infinity, 48), // Mengatur ukuran minimum
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Mengatur sudut melengkung pada tombol
                          ),
                          // Menambahkan gaya tambahan menggunakan tambahan properti
                          backgroundColor: Colors.blue,
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          elevation: 4,
                        ),
                        child: Text(isLoginForm ? 'Login' : 'Sign Up'),
                      ),
                      SizedBox(height: 70),
                      TextButton(
                        onPressed: () {
                          navigateToPage('/login');
                        },
                        child: RichText(
                          text: TextSpan(
                            text: isLoginForm
                                ? 'Belum Punya akun? '
                                : 'Sudah punya akun? ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: isLoginForm ? 'Sign Up' : 'Login',
                                style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
