import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'navbar.dart';
import 'menu/menu1.dart';
import 'menu/menu2.dart';
import 'menu/menu3.dart';
import 'menu/menu4.dart';
import 'menu/menu5.dart';
import 'menu/menu6.dart';
import 'menu/menu7.dart';
import 'menu/menu8.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/home': (context) => NavBar(),
        '/menu1': (context) => Menu1Page(),
        '/menu2': (context) => Menu2Page(),
        '/menu3': (context) => Menu3Page(),
        '/menu4': (context) => Menu4Page(),
        '/menu5': (context) => Menu5Page(),
        '/menu6': (context) => Menu6Page(),
        '/menu7': (context) => Menu7Page(),
        '/menu8': (context) => Menu8Page(),
        // tambahkan rute untuk halaman lainnya
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];

  final List<String> menuNames = [
    "User's",
    "Mail",
    "User's",
    "Folder",
    "Chart",
    "Add",
    "Expo",
    "Log Out",
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, Admins'),
        backgroundColor: Color(0xFF001431),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: Colors.transparent,
            ),
            child: Image(
              height: 30,
              width: 30,
              image: AssetImage("assets/images/tekno.png",
              
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Center(
                  child: Text(
                    'Banner',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF001431),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 8,
                      blurRadius: 15,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MenuCard(
                    icon: getIcon(index),
                    title: menuNames[index],
                    color: Color(0xFFD40808),
                    onTap: () {
                      navigateToPage(context, index);
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: carouselImages.map((image) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData getIcon(int index) {
    switch (index % 8) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.mail;
      case 2:
        return Icons.people_alt;
      case 3:
        return Icons.folder;
      case 4:
        return Icons.bar_chart;
      case 5:
        return Icons.playlist_add;
      case 6:
        return Icons.event_note_rounded;
      case 7:
        return Icons.logout_outlined;
      default:
        return Icons.restaurant_menu;
    }
  }

  void navigateToPage(BuildContext context, int index) {
    String route;
    switch (index) {
      case 0:
        route = '/menu1';
        break;
      case 1:
        route = '/menu2';
        break;
      case 2:
        route = '/menu3';
        break;
      case 3:
        route = '/menu4';
        break;
      case 4:
        route = '/menu5';
        break;
      case 5:
        route = '/menu6';
        break;
      case 6:
        route = '/menu7';
        break;
      case 7:
        route = '/menu8';
        break;
      default:
        route = '/home';
    }
    Navigator.pushNamed(context, route);
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const MenuCard({
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
