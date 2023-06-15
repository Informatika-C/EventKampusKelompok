import 'package:flutter/material.dart';
import 'package:tekno_expo/setting-parts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int activeExpandedIndex = -1;

  void toggleExpanded(int expandedIndex) {
    setState(() {
      if (activeExpandedIndex == expandedIndex) {
        activeExpandedIndex = -1; // Menutup expanded yang sedang aktif
      } else {
        activeExpandedIndex = expandedIndex; // Membuka expanded yang dipilih
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Page'),
        backgroundColor: Color(0xFF001431),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Setting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
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
              ],
            ),
            Column(
              children: [
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
              ],
            ),
            Column(
              children: [
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
