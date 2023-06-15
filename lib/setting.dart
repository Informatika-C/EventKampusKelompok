import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekno_expo/screen/login.dart';
import 'package:tekno_expo/setting-parts.dart';
import 'package:tekno_expo/utils/storage_service.dart';
import 'package:tekno_expo/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.senTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: P(),
    );
  }
}

class P extends StatefulWidget {
  @override
  _PState createState() => _PState();
}

class _PState extends State<P> with SingleTickerProviderStateMixin {
  void logout() async {
    try {
      final SharedPreferences sharedPref = await StorageService().init();
      final bool result = await sharedPref.remove('access_token');
      if (result == true) {
        Get.offAll(LoginPage());
      } else {
        throw Exception('Gagal Logout');
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  int activeExpandedIndex = -1;

  void toggleExpanded(int expandedIndex) {
    setState(() {
      if (activeExpandedIndex == expandedIndex) {
        activeExpandedIndex = -1;
      } else {
        activeExpandedIndex = expandedIndex;
      }
    });
  }

  bool showTabEvent = true;
  bool showTabSetting = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> TabEvent = [
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Event",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Cabang Lomba",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tanggal Mulai",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tanggal Penyisihan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tanggal Selesai",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ":  Gebyar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ":  Design Web",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ":  10-5-2023",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ":  15-5-2023",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ":  20-5-2023",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ];

    final List<Widget> TabSetting = [
      TextButton(
        onPressed: () {
          setState(() {
            toggleExpanded(1);
          });
        },
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(
                activeExpandedIndex == 1
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
              ),
            ],
          ),
        ),
      ),
      if (activeExpandedIndex == 1)
        AccountParts(
          isExpanded: true,
        ),
      TextButton(
        onPressed: () {
          setState(() {
            toggleExpanded(2);
          });
        },
        child: ListTile(
          leading: Icon(Icons.notifications),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(
                activeExpandedIndex == 2
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
              ),
            ],
          ),
        ),
      ),
      if (activeExpandedIndex == 2)
        NotificationParts(
          isExpanded: true,
        ),
      TextButton(
        onPressed: () {
          setState(() {
            toggleExpanded(3);
          });
        },
        child: ListTile(
          leading: Icon(Icons.security),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Security Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(
                activeExpandedIndex == 3
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
              ),
            ],
          ),
        ),
      ),
      if (activeExpandedIndex == 3)
        SecurityParts(
          isExpanded: true,
        ),
      TextButton(
        onPressed: () {
          logout();
        },
        child: ListTile(
          leading: Icon(
            Icons.logout_outlined,
            color: Color(0xffd40808),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffd40808),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color(0xFF001431),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: 180,
                                child: Image.asset(
                                  'assets/images/ffd.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Aksi yang dijalankan ketika ikon edit di tekan
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "john doe",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "johndoe@gmail.com",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 15, left: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 0, 32, 58),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              showTabEvent = true;
                              showTabSetting = false;
                            });
                          },
                          icon: Icon(Icons.event),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              showTabEvent = false;
                              showTabSetting = true;
                            });
                          },
                          icon: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Visibility(
                            visible: showTabEvent,
                            child: Column(
                              children: TabEvent,
                            ),
                          ),
                        ),
                        Container(
                          child: Visibility(
                            visible: showTabSetting,
                            child: Column(
                              children: TabSetting,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
