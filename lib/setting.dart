import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class _PState extends State<P> {
  List<Item> _items = [
    Item(
        headerValue: 'Dropdown 1',
        expandedValue: ['Menu 1', 'Menu 2', 'Menu 3']),
    Item(
        headerValue: 'Dropdown 2',
        expandedValue: ['Menu 4', 'Menu 5', 'Menu 6']),
    Item(
        headerValue: 'Dropdown 3',
        expandedValue: ['Menu 7', 'Menu 8', 'Menu 9']),
  ];

  String name = 'John Doe';
  String email = 'johndoe@example.com';
  String phone = '+1 123 456 7890';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void updateProfile() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      phone = phoneController.text;
    });
    Navigator.pop(
        context); // Kembali ke halaman profil setelah memperbarui profil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color(0xFF001431),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/ffd.jpeg'),
                      ),
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
                          name,
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
                          email,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('Open Modal'),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView(
                                  children: _items.map<Widget>((Item item) {
                                    return ExpansionPanelList(
                                      elevation: 1,
                                      expandedHeaderPadding: EdgeInsets.all(0),
                                      expansionCallback:
                                          (int index, bool isExpanded) {
                                        setState(() {
                                          item.isExpanded = !isExpanded;
                                        });
                                      },
                                      children: [
                                        ExpansionPanel(
                                          headerBuilder: (BuildContext context,
                                              bool isExpanded) {
                                            return ListTile(
                                              title: Text(item.headerValue),
                                            );
                                          },
                                          body: Column(
                                            children: item.expandedValue
                                                .map<Widget>((String menu) {
                                              return ListTile(
                                                title: Text(menu),
                                              );
                                            }).toList(),
                                          ),
                                          isExpanded: item.isExpanded,
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({required this.headerValue, required this.expandedValue});

  String headerValue;
  List<String> expandedValue;
  bool isExpanded = false;
}
