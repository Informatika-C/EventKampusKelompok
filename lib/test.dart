import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: P(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
    );
  }
}

class P extends StatefulWidget {
  @override
  _PState createState() => _PState();
}

class _PState extends State<P> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event'),
        backgroundColor: Color(0xFF001431),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding:
              EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          indicatorWeight: 5.0,
          indicatorColor: Color(0xFFd40808),
          labelColor: Colors.white,
          unselectedLabelColor: Color.fromRGBO(147, 147, 156, 1),
          tabs: [
            Tab(
              text: 'Academic',
            ),
            Tab(
              text: 'None Academic',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          //Tab akademic
          Container(
            margin: EdgeInsets.all(6),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        20,
                        (index) => Stack(
                          children: [
                            Container(
                              height: 260,
                              width: 160,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(55, 56, 58, 1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 13,
                              right: 6,
                              child: GestureDetector(
                                  child: Container(
                                    height: 210,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 152, 25, 1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Image border
                                      child: SizedBox.fromSize(
                                        child: Image.asset(
                                            'assets/images/desainweb.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test()),
                                    );
                                  }),
                            ),
                            Positioned(
                              top: 225,
                              left: 13,
                              right: 6,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Desain Web',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      '24 May 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.yellowAccent),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        20,
                        (index) => Stack(
                          children: [
                            Container(
                              height: 260,
                              width: 160,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(55, 56, 58, 1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 13,
                              right: 6,
                              child: GestureDetector(
                                  child: Container(
                                    height: 210,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 152, 25, 1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Image border
                                      child: SizedBox.fromSize(
                                        child: Image.asset(
                                            'assets/images/seminar-pendidikan.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test()),
                                    );
                                  }),
                            ),
                            Positioned(
                              top: 225,
                              left: 13,
                              right: 6,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Seminar Pendidikan',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      '04 June 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.yellowAccent),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
          ),
          //Tab none akademic
          Container(
            margin: EdgeInsets.all(6),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        20,
                        (index) => Stack(
                          children: [
                            Container(
                              height: 260,
                              width: 160,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(55, 56, 58, 1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 13,
                              right: 6,
                              child: GestureDetector(
                                  child: Container(
                                    height: 210,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 152, 25, 1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Image border
                                      child: SizedBox.fromSize(
                                        child: Image.asset(
                                            'assets/images/desainweb.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test()),
                                    );
                                  }),
                            ),
                            Positioned(
                              top: 225,
                              left: 13,
                              right: 6,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Desain Web',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      '24 May 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.yellowAccent),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        20,
                        (index) => Stack(
                          children: [
                            Container(
                              height: 260,
                              width: 160,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(55, 56, 58, 1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 13,
                              right: 6,
                              child: GestureDetector(
                                  child: Container(
                                    height: 210,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 152, 25, 1),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Image border
                                      child: SizedBox.fromSize(
                                        child: Image.asset(
                                            'assets/images/seminar-pendidikan.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Test()),
                                    );
                                  }),
                            ),
                            Positioned(
                              top: 225,
                              left: 13,
                              right: 6,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      'Seminar Pendidikan',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      '04 June 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.yellowAccent),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );
  }
}
