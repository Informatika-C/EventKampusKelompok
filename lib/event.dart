import 'package:flutter/material.dart';
import 'package:tekno_expo/event-parts.dart';

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
      home: EventPage(),
    );
  }
}

class EventPage extends StatelessWidget {
  final List<String> cardData =
      List.generate(10, (index) => 'Card ${index + 1}');
  final List<String> cardData2 =
      List.generate(10, (index) => 'New Card ${index + 1}');

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event'),
          backgroundColor: Color(0xFF001431),
          bottom: TabBar(
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Sen',
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
          children: [
            buildGridView(cardData),
            buildGridView2(cardData2),
          ],
        ),
      ),
    );
  }

// Tab Academic
  @override
  Widget buildGridView(List<String> data) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              return buildCard(context, cardData[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetWidget.showBottomSheet(context);
                    },
                  );
                },
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
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      child: Image.asset(
                        'assets/images/seminar-pendidikan.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 6,
              right: 6,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Text(
                      'Seminar Pendidikan',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Text(
                      '24 May 2024',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.yellowAccent,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

// Tab None Academic
  Widget buildGridView2(List<String> data) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              return buildCard2(context, cardData2[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard2(BuildContext context, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetWidget.showBottomSheet(context);
                    },
                  );
                },
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
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      child: Image.asset(
                        'assets/images/desainweb.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 6,
              right: 6,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Text(
                      'Desain Web',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Text(
                      '24 May 2024',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.yellowAccent,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
