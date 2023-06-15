import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tekno_expo/utils/url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tekno_expo/utils/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/navbar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  bool isError = false;
  String errorMassage = '';

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  void register() async {
    final url = Uri.parse('${URL.BASE_URL}auth/register');
    final body = {
      'username': _usernameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'password_confirm': _passwordConfirmController.text,
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
      if (response.statusCode == 201) {
        final SharedPreferences sharedPref = await StorageService().init();
        final bool result =
            await sharedPref.setString('access_token', data['access_token']);
        if (result == true) {
          Get.offAll(NavBar());
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
        msg: 'Register gagal',
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
                  child: SingleChildScrollView(
                    child: IntrinsicWidth(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 70),
                              TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                ),
                              ),
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
                              TextFormField(
                                obscureText: true,
                                controller: _passwordConfirmController,
                                decoration: const InputDecoration(
                                  labelText: 'Confirm Password',
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        register();
                                      },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical:
                                          16), // Mengatur padding vertikal
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                          : const Text('Register')),
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
                            ],
                          ),
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
