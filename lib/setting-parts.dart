import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/controller/account_controller.dart';
import 'package:tekno_expo/controller/user_controller.dart';

class AccountParts extends StatelessWidget {
  AccountController accountController = Get.find();
  UserController userController = Get.find();

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
                Container(
                  width: 190,
                  child: Text(
                    'Name: ${Get.find<UserController>().user.value.nama}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newName = '';

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
                                Navigator.pop(context);
                                if (newName != '') {
                                  userController
                                      .updateName(newName)
                                      .then((result) {
                                    if (result) {
                                      Get.snackbar(
                                        'Success',
                                        'Name updated successfully',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Failed to update name',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  });
                                } else {
                                  // make toast
                                  Get.snackbar(
                                    'Error',
                                    'Name cannot be empty',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
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
                Container(
                  width: 180,
                  child: Text(
                    'Email  : ${Get.find<UserController>().user.value.email}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newEmail = '';

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
                                Navigator.pop(context);
                                if (newEmail != '') {
                                  userController
                                      .updateEmail(newEmail)
                                      .then((result) {
                                    if (result) {
                                      Get.snackbar(
                                        'Success',
                                        'Email updated successfully',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Failed to update email',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  });
                                } else {
                                  // make toast
                                  Get.snackbar(
                                    'Error',
                                    'email cannot be empty',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
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
                Container(
                  width: 180,
                  child: Text(
                    'NPM  : ${Get.find<UserController>().user.value.npm}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newNPM = '';

                        return AlertDialog(
                          title: Text('Change NPM'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter your new NPM',
                                ),
                                onChanged: (value) {
                                  newNPM = value;
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
                                Navigator.pop(context);

                                // check if newNPM is not number
                                if (isNumeric(newNPM) == false) {
                                  Get.snackbar(
                                    'Error',
                                    'NPM must be a number',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                  return;
                                }

                                if (newNPM != '') {
                                  userController
                                      .updateNPM(newNPM)
                                      .then((result) {
                                    if (result) {
                                      Get.snackbar(
                                        'Success',
                                        'NPM updated successfully',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Failed to update NPM',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  });
                                } else {
                                  // make toast
                                  Get.snackbar(
                                    'Error',
                                    'NPM cannot be empty',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
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

                        return AlertDialog(
                          title: Text('Change Phone Number'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter your new Phone',
                                ),
                                onChanged: (value) {
                                  newPhone = value;
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
                                Navigator.pop(context);

                                // check if newPhone not number
                                if (isNumeric(newPhone) == false) {
                                  Get.snackbar(
                                    'Error',
                                    'Phone must be number',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                  return;
                                }

                                if (newPhone != '') {
                                  userController
                                      .updatePhone(newPhone)
                                      .then((result) {
                                    if (result) {
                                      Get.snackbar(
                                        'Success',
                                        'Phone updated successfully',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Failed to update Phone',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  });
                                } else {
                                  // make toast
                                  Get.snackbar(
                                    'Error',
                                    'Phone cannot be empty',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
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
  UserController userController = Get.find<UserController>();

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
                                Navigator.pop(context);
                                if (newPassword != '' && password != '') {
                                  // check newPassword length
                                  if (newPassword.length < 8) {
                                    Get.snackbar(
                                      'Error',
                                      'Password must be at least 8 characters',
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                    return;
                                  }

                                  userController
                                      .updatePassword(newPassword, password)
                                      .then((result) {
                                    if (result) {
                                      Get.snackbar(
                                        'Success',
                                        'Password updated successfully',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Failed to update Password',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  });
                                } else {
                                  // make toast
                                  Get.snackbar(
                                    'Error',
                                    'Password cannot be empty',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
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

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
