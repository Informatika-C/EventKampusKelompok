import 'package:flutter/material.dart';

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
                      return Container(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Card Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                data,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
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
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Card Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text('Item ${index + 1}'),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              backgroundColor: Colors.red,
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 650,
                                                width: 350,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 0, 5, 94),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300 * 0.5,
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Image.asset(
                                                                'assets/images/desainweb.jpg',
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Wrap(
                                                            children: [
                                                              Container(
                                                                width:
                                                                    350 * 0.5,
                                                                child: Text(
                                                                  "abdasdakjbdadab adubadbabudakbuaol ifa,fjbakbakf kefakfakfafu vkafakfevajfakvfuavfakuf kavkfvakufvaufuafuauvkf faegksf eufkabfa",
                                                                  maxLines: 5,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      width: 330,
                                                      height: 350,
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          // color: Colors.brown,
                                                          ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Details Perlombaan',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            color: Colors.white,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Event',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    'Cabang Perlombaan',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    'Tanggal Pendaftaran',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    'Tanggal Mulai',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    'Tanggal Penyisihan',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    'Tanggal Final',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    'Status Pendaftaran',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    ':  Protek',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ':  Desain Web',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ':  01-05-2023',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ':  10-05-2023',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ':  15-05-2023',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ':  20-05-2023',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  Text(
                                                                    ':  ? terdaftar : -',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Deskripsi',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              ElevatedButton(
                                                                style: ButtonStyle(
                                                                    fixedSize:
                                                                        MaterialStatePropertyAll(Size(
                                                                            330,
                                                                            40)),
                                                                    backgroundColor:
                                                                        MaterialStatePropertyAll(Color.fromARGB(
                                                                            255,
                                                                            175,
                                                                            29,
                                                                            29))),
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                  "Daftar ? Terdaftar == Disabled",
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
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
