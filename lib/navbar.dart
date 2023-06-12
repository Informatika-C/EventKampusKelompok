import 'package:flutter/material.dart';
import 'setting.dart';
import 'home.dart';
import 'test.dart';
import 'routes/update.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Bottom Navigation Bar Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.senTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Navbar(),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    Test(),
    Update(),
    Setting(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: GNav(
          selectedIndex: _currentIndex,
          onTabChange: onTabTapped,
          backgroundColor: Color(0xFF001431),
          color: Colors.white,
          activeColor: Color(0xFFD40808),
          tabBackgroundColor: Color.fromRGBO(51, 56, 58, 1),
          padding: EdgeInsets.all(18),
          tabMargin: EdgeInsets.all(10),
          gap: 20,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.calendar_today,
              text: "Event",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.settings,
              text: "Profile",
            ),
          ]),
    );
  }
}
