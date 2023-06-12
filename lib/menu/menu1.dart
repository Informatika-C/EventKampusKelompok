// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Menu1Page extends StatelessWidget {
  // Widgets start
  List<Widget> caseEvent() {
    List<Widget> containerList = [];
    for (int i = 0; i < 3; i++) {
      containerList.add(
        Container(
          width: 155,
          height: 156,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 188, 25, 25),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text("This is image"),
            ),
          ),
        ),
      );
    }
    return containerList;
  }

// end widgets

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double deviceVW = screenSize.width;
    final double deviceVH = screenSize.height;
    final PrimaryColorBlue = Color.fromARGB(255, 7, 0, 49);
    final PrimaryColorRed = Color.fromARGB(255, 210, 42, 42);
    final radiusPrimary = BorderRadius.only(
        topRight: Radius.circular(10), bottomLeft: Radius.circular(10));

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "San",
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("EVENTS"),
          backgroundColor: PrimaryColorBlue,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: caseEvent(),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "EVENTS",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              // Picture Banner Activity Event

              Container(
                width: deviceVW,
                height: 200,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: PrimaryColorRed,
                  borderRadius: radiusPrimary,
                ),
                child: Center(
                    child: Text(
                  "Banner Activity Event",
                  style: TextStyle(color: Colors.white),
                )),
              ),

              // Statistic Ranks Peserta

              Container(
                width: deviceVW,
                height: 300,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: PrimaryColorRed,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Table Ranks",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
