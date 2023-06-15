import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tekno_expo/navbar.dart';
import 'package:tekno_expo/screen/register.dart';
import 'dart:convert';
import 'package:tekno_expo/utils/url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tekno_expo/utils/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool isError = false;
  String errorMassage = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final url = Uri.parse('${URL.BASE_URL}auth/login');
    final body = {
      'email': _emailController.text,
      'password': _passwordController.text
    };
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        url,
        body: body,
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final SharedPreferences sharedPref = await StorageService().init();
        final bool result =
            await sharedPref.setString('access_token', data['access_token']);
        if (result == true) {
          Get.to(NavBar());
        } else {
          throw Exception('Gagal menyimpan data');
        }
      } else {
        String error = jsonEncode(data['errors']);
        if (jsonDecode(error) is Map<String, dynamic>) {
          Map<String, dynamic> jsonObject = jsonDecode(error);
          setState(() {
            errorMassage = '';
          });
          jsonObject.forEach((key, value) {
            setState(() {
              isError = true;
              errorMassage = errorMassage + '$value\n';
            });
          });
        } else {
          setState(() {
            errorMassage = data['errors'];
          });
        }
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: SingleChildScrollView(
            child: FractionallySizedBox(
              widthFactor: 0.7,
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
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
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
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      login();
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
                                backgroundColor:
                                    isLoading ? Colors.grey : Colors.blue,
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                elevation: 4,
                              ),
                              child: SizedBox(
                                height: isLoading ? 20.0 : null,
                                width: isLoading ? 20.0 : null,
                                child: Center(
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text('Login')),
                              ),
                            ),
                            const SizedBox(height: 20),
                            isError
                                ? Text(
                                    errorMassage,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 50),
                            TextButton(
                              onPressed: () {
                                Get.to(RegisterPage());
                              },
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Belum Punya akun? ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Register',
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
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
