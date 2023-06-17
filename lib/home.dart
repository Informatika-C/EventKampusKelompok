import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/controller/homePage_controller.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'navbar.dart';
import 'event.dart';
// import 'menu/menu1.dart';
import 'menu/menu2.dart';
import 'menu/menu3.dart';
import 'menu/menu4.dart';
import 'menu/menu5.dart';
import 'menu/menu6.dart';
import 'menu/menu7.dart';
import 'menu/menu8.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!homePageController.getIsLoading) {
          return HomePage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePageController homePageController = Get.find();

  final List<String> carouselImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];

  final List<String> menuNames = [
    "User's",
    "Event",
    "History",
  ];

  final List<String> textItems = [
    'Hi, ${Get.find<UserController>().user.value.username}',
    'Kamu belum ikut event apapun',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tekno Expo'),
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
              image: AssetImage(
                "assets/images/tekno.png",
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
                // padding: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    // enlargeCenterPage:  true,
                    autoPlay: true,
                  ),
                  items: carouselImages.map((image) {
                    return Container(
                      // margin: EdgeInsets.symmetric(horizontal: 4),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                decoration: BoxDecoration(
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF001431),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 40,
                            enableInfiniteScroll: true,
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 400),
                            autoPlayInterval: Duration(seconds: 2),
                          ),
                          items: textItems.map((text) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 18),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 0.8,
                  childAspectRatio: 1,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          reverse: true,
                          height: 70,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          // autoPlayInterval: Duration(milliseconds: 500),
                        ),
                        items: [
                          Container(
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                'Carousel 1',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Carousel 2',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                'Carousel 3',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 70,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                        ),
                        items: [
                          Container(
                            color: Colors.orange,
                            child: Center(
                              child: Text(
                                'Carousel A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.purple,
                            child: Center(
                              child: Text(
                                'Carousel B',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: Center(
                              child: Text(
                                'Carousel C',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          'assets/images/detik.jpeg',
                          height: 210,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seminar Pengusaha Muda',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'jakvkavj b svhasbvkajvbanksjvasjva aksjvbashasmn ',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/tekno.png',
                          width: 25.0,
                          height: 25.0,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Terbaru',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Masih hangat nih  🙌',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 260,
                                child: Text(
                                  'Yang terbaik ada disini, yuk pilih yang kamu minati !',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(70.0, 40.0),
                                primary: Color(0xFFD40808),
                              ),
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                              },
                              child: Text('Lainnya'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(4),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: carouselImages.map((imagePath) {
                    return Container(
                      width: 170.0,
                      height: 250.0,
                      margin: EdgeInsets.only(bottom: 5, left: 12, right: 12),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14.0),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                color: Color.fromRGBO(55, 56, 58, 1),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  height: 30,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Seminar Pendidikan afbafgfdd adadabasa',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '24 May 2024',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.yellowAccent,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          'assets/images/depok.jpeg',
                          height: 210,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seminar Pengusaha Muda',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'jakvkavj b svhasbvkajvbanksjvasjva aksjvbashasmn ',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/tekno.png',
                          width: 25.0,
                          height: 25.0,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Tekno',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pilihan non akademik  📌',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 260,
                                child: Text(
                                  'Temukan banyak perlombaan Olahraga, Seni, dan banyak lagi!',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(70.0, 40.0),
                                primary: Color(0xFFD40808),
                              ),
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                              },
                              child: Text('Lainnya'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(4),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: carouselImages.map((imagePath) {
                    return Container(
                      width: 350.0,
                      height: 200.0,
                      margin: EdgeInsets.only(bottom: 5, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(14.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 4),
                            spreadRadius: -3,
                            blurRadius: 5,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/tekno.png',
                          width: 25.0,
                          height: 25.0,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'FSIP',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pilihan akademik  📚',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 260,
                                child: Text(
                                  'Yang terbaik ada disini, yuk pilih yang kamu minati !',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(70.0, 40.0),
                                primary: Color(0xFFD40808),
                              ),
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                              },
                              child: Text('Lainnya'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(4),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: carouselImages.map((imagePath) {
                    return Container(
                      width: 350.0,
                      height: 200.0,
                      margin: EdgeInsets.only(bottom: 5, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(14.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 4),
                            spreadRadius: -3,
                            blurRadius: 5,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          'assets/images/depok.jpeg',
                          height: 210,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kepo 2020',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'kaisn vkajkhsvbasuho sbvjausvk askhagsicaow',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData getIcon(int index) {
    switch (index % 3) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.calendar_today_rounded;
      case 2:
        return Icons.history;
      default:
        return Icons.person;
    }
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Get.to(Menu2Page());
        break;
      case 2:
        Get.to(Menu3Page());
        break;
    }
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
      margin: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      color: color,
      elevation: 7,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(2),
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
