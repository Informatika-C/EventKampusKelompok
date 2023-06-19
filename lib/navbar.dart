import 'package:flutter/material.dart';
import 'setting.dart';
import 'home.dart';
import 'event.dart';
import 'addEvent.dart';
import 'routes/update.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'controller/user_controller.dart';
import 'controller/navbar_controller.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tekno Expo',
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
  UserController userController = Get.put(UserController());
  NavbarController navBarController = Get.put(NavbarController());

  final List<Widget> _children = [
    Home(),
    Event(),
    Setting(),
    EventForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!userController.isLoading.value) {
        return Scaffold(
          body: _children[navBarController.index.value],
          bottomNavigationBar: GNav(
              selectedIndex: navBarController.index.value,
              onTabChange: (index) {
                navBarController.changeIndex(index);
              },
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
                  icon: Icons.person,
                  text: "Profile",
                ),
                if (userController.user.value.role == 'admin')
                  GButton(
                    icon: Icons.add,
                    text: "Add Event",
                  ),
              ]),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
