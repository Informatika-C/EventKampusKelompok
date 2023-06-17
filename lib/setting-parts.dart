import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/controller/Account_controller.dart';
import 'package:tekno_expo/controller/user_controller.dart';

class AccountParts extends StatelessWidget {
  AccountController accountController = Get.find();

  final bool isExpanded;

  AccountParts({required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60),
      decoration: BoxDecoration(color: Color.fromARGB(131, 222, 222, 222)),
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name: ${Get.find<UserController>().user.value.nama}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newName = '';
                        String password = '';

                        return AlertDialog(
                          title: Text('Change Name'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your new name',
                                ),
                                onChanged: (value) {
                                  newName = value;
                                },
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm your password',
                                ),
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Logika perubahan nama dan password
                                // Gunakan variabel newName dan password
                                // ...
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.change_circle),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email: ${Get.find<UserController>().user.value.email}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newEmail = '';
                        String password = '';

                        return AlertDialog(
                          title: Text('Change Email'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your new email',
                                ),
                                onChanged: (value) {
                                  newEmail = value;
                                },
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm your password',
                                ),
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Logika perubahan Email
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.change_circle),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone: ${Get.find<UserController>().user.value.noHp}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newPhone = '';
                        String password = '';

                        return AlertDialog(
                          title: Text('Change Phone Number'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your new Phone',
                                ),
                                onChanged: (value) {
                                  newPhone = value;
                                },
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm your password',
                                ),
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Logika perubahan Email
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.change_circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationParts extends StatefulWidget {
  final bool isExpanded;

  NotificationParts({required this.isExpanded});

  @override
  _NotificationPartsState createState() => _NotificationPartsState();
}

class _NotificationPartsState extends State<NotificationParts> {
  bool notificationSwitchValue = false; // Nilai awal switch

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60),
      decoration: BoxDecoration(color: Color.fromARGB(131, 222, 222, 222)),
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Turn Notification',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Switch(
                  value: notificationSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      notificationSwitchValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecurityParts extends StatelessWidget {
  final bool isExpanded;

  SecurityParts({required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60),
      decoration: BoxDecoration(color: Color.fromARGB(131, 222, 222, 222)),
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newPassword = '';
                        String password = '';

                        return AlertDialog(
                          title: Text('Change Password'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your new Password',
                                ),
                                onChanged: (value) {
                                  newPassword = value;
                                },
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm your password',
                                ),
                                onChanged: (value) {
                                  password = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Logika perubahan Email
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.change_circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
