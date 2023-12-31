import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekno_expo/screen/login.dart';
import 'package:tekno_expo/setting-parts.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/controller/account_controller.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'package:tekno_expo/controller/homepage_controller.dart';
import 'package:tekno_expo/controller/event_controller.dart';
import 'package:tekno_expo/controller/history_controller.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!accountController.getIsLoading) {
          return P();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

class P extends StatefulWidget {
  @override
  _PState createState() => _PState();
}

class _PState extends State<P> with SingleTickerProviderStateMixin {
  AccountController accountController = Get.find();
  HistoryController historyController = Get.put(HistoryController());

  @override
  void dispose() {
    Get.delete<HistoryController>();
    super.dispose();
  }

  void logout() async {
    try {
      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      final bool result = await sharedPref.clear();

      Get.delete<HomePageController>();
      Get.delete<AccountController>();
      Get.delete<UserController>();
      Get.delete<EventController>();

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
  bool showTabEvent = true;
  bool showTabSetting = false;
  Color Tabs1 = Color.fromARGB(255, 139, 0, 0);
  Color Tabs2 = Color.fromARGB(255, 255, 255, 255);

  void toggleExpanded(int expandedIndex) {
    setState(() {
      if (activeExpandedIndex == expandedIndex) {
        activeExpandedIndex = -1;
      } else {
        activeExpandedIndex = expandedIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: 170,
                                child: Image.asset(
                                  'assets/images/ffd.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: Container(
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  iconSize: 15,
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Ubah Foto Profil '),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Pilih foto profil'),
                                              SizedBox(height: 10),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Aksi yang dijalankan ketika tombol di tekan
                                                  // Tambahkan kode untuk memilih file gambar
                                                },
                                                child: Text('Pilih Gambar'),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                // Aksi yang dijalankan ketika tombol "Cancel" di tekan
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Aksi yang dijalankan ketika tombol "Upload" di tekan
                                                // Tambahkan kode untuk mengunggah file gambar
                                              },
                                              child: Text('Upload'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '${Get.find<UserController>().user.value.nama}',
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '${Get.find<UserController>().user.value.email}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'NPM',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '${Get.find<UserController>().user.value.npm}',
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
                          color: Tabs1,
                          onPressed: () {
                            setState(() {
                              showTabEvent = true;
                              showTabSetting = false;
                              Tabs1 = Color.fromARGB(255, 139, 0, 0);
                              Tabs2 = Color.fromARGB(255, 255, 255, 255);
                            });
                          },
                          icon: Icon(Icons.event),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          color: Tabs2,
                          onPressed: () {
                            setState(() {
                              showTabEvent = false;
                              showTabSetting = true;
                              Tabs1 = Color.fromARGB(255, 255, 255, 255);
                              Tabs2 = Color.fromARGB(255, 139, 0, 0);
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
                              child: Obx(() {
                                if (historyController.getIsLoading) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      historyController.getListHistory.length,
                                  itemBuilder: (context, index) {
                                    return ListEvent(
                                      namaEvent: historyController
                                          .getListHistory[index]['nama_event'],
                                      cabangLomba: historyController
                                              .getListHistory[index]
                                          ['nama_kategori'],
                                      tanggalPendaftaran: historyController
                                              .getListHistory[index]
                                          ['tanggal_pendaftaran'],
                                      tanggalPenyisihan: historyController
                                              .getListHistory[index]
                                          ['tanggal_penyisihan'],
                                      tanggalFinal: historyController
                                              .getListHistory[index]
                                          ['tanggal_final'],
                                    );
                                  },
                                );
                              })),
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

class ListEvent extends StatelessWidget {
  final String namaEvent;
  final String cabangLomba;
  final String tanggalPendaftaran;
  final String tanggalPenyisihan;
  final String tanggalFinal;

  const ListEvent(
      {super.key,
      required this.namaEvent,
      required this.cabangLomba,
      required this.tanggalPendaftaran,
      required this.tanggalPenyisihan,
      required this.tanggalFinal});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "Tanggal Pendaftaran",
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
                    "Tanggal Final",
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
                  Container(
                    width: 150,
                    child: Text(
                      ":  ${namaEvent}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      ":  ${cabangLomba}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    ":  ${tanggalPendaftaran}",
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
                    ":  ${tanggalPenyisihan}",
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
                    ":  ${tanggalFinal}",
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
    );
  }
}
