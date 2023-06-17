import 'package:flutter/material.dart';
import 'package:tekno_expo/controller/event_controller.dart';
import 'package:get/get.dart';

class Event extends StatefulWidget {
  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  final EventController eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sen',
      ),
      home: Obx(() {
        if (!eventController.getIsLoading) {
          return EventPage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

class EventPage extends StatelessWidget {
  EventController eventController = Get.find();

  final List<String> cardData = List.generate(
      Get.find<EventController>().getListEvenAcademic.length,
      (index) =>
          '${Get.find<EventController>().getListEvenAcademic[index]['nama_event']}}');

  final List<String> cardData2 = List.generate(
      Get.find<EventController>().getListEvenNonAcademic.length,
      (index) =>
          '${Get.find<EventController>().getListEvenNonAcademic[index]['nama_event']}}');

  void BottomSheet(
      BuildContext context, int id_event, bool academic, int index_event) {
    EventController eventController = Get.find();
    eventController.getKategori(id_event);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Obx(() {
          if (!eventController.getIsLoadingBottomSheet) {
            return BottomSheetWidget(academic, index_event);
          } else {
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
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
      },
    );
  }

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
              return buildCard(context, cardData[index], index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String data, int index) {
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
                  BottomSheet(
                      context,
                      int.parse(eventController.getListEvenAcademic[index]
                          ['id_event']),
                      true,
                      index);
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
                      child: Image.network(
                        eventController.getListEvenAcademic[index]
                            ['gambar_poster'],
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
                      eventController.getListEvenAcademic[index]['nama_event'],
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
                      eventController.getListEvenAcademic[index]['tanggal'],
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
            itemCount: cardData2.length,
            itemBuilder: (context, index) {
              return buildCard2(context, cardData2[index], index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard2(BuildContext context, String data, int index) {
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
                  BottomSheet(
                      context,
                      int.parse(eventController.getListEvenNonAcademic[index]
                          ['id_event']),
                      false,
                      index);
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
                      child: Image.network(
                        eventController.getListEvenNonAcademic[index]
                            ['gambar_poster'],
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
                      eventController.getListEvenNonAcademic[index]
                          ['nama_event'],
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
                      eventController.getListEvenNonAcademic[index]['tanggal'],
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

// Make Widget BottomSheet
class BottomSheetWidget extends StatefulWidget {
  final bool academic;
  final int index_event;

  const BottomSheetWidget(
    this.academic,
    this.index_event,
  );

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  EventController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
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
            Container(
              margin: EdgeInsets.only(bottom: 13),
              height: 6.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 90, 88, 88),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Text(
              widget.academic ? 'Kategori Academic' : 'Kategori Non Academic',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: eventController.getListKategori.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    selectedColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    title: Text(
                        '${eventController.getListKategori[index]['nama_kategori']}'),
                    subtitle: Text(
                        '${eventController.getListKategori[index]['jumlah_peserta']} Per ${eventController.getListKategori[index]['kapasitas']} Orang'),
                    leading: Icon(Icons.info),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                            ),
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            content: Container(
                              width: 350.0,
                              height: 450.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        alignment: Alignment.topLeft,
                                        width: 300 * 0.5,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            widget.academic
                                                ? eventController
                                                            .getListEvenAcademic[
                                                        widget.index_event]
                                                    ['gambar_poster']
                                                : eventController
                                                            .getListEvenNonAcademic[
                                                        widget.index_event]
                                                    ['gambar_poster'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Container(
                                            margin: EdgeInsets.all(4),
                                            width: 300 * 0.5,
                                            child: Text(
                                              widget.academic
                                                  ? eventController
                                                              .getListEvenAcademic[
                                                          widget.index_event]
                                                      ['nama_event']
                                                  : eventController
                                                              .getListEvenNonAcademic[
                                                          widget.index_event]
                                                      ['nama_event'],
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(4),
                                            width: 300 * 0.5,
                                            child: Text(
                                              widget.academic
                                                  ? eventController
                                                              .getListEvenAcademic[
                                                          widget.index_event]
                                                      ['keterangan']
                                                  : eventController
                                                              .getListEvenNonAcademic[
                                                          widget.index_event]
                                                      ['keterangan'],
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 330,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        // color: Colors.brown,
                                        ),
                                    child: Column(
                                      children: [
                                        Divider(
                                          color: Colors.black,
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Details Perlombaan',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Event',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Cabang Perlombaan',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Tanggal Pendaftaran',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Tanggal Penyisihan',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Tanggal Final',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Status Pendaftaran',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 145,
                                                  child: Text(
                                                    ':  ${widget.academic ? eventController.getListEvenAcademic[widget.index_event]['nama_event'] : eventController.getListEvenNonAcademic[widget.index_event]['nama_event']}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Container(
                                                  width: 145,
                                                  child: Text(
                                                    ':  ${eventController.getListKategori[index]['nama_kategori']}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Text(
                                                  ':  ${eventController.getListKategori[index]['pendaftaran']}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  ':  ${eventController.getListKategori[index]['penyisihan']}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  ':  ${eventController.getListKategori[index]['final']}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  ':  ${eventController.getListKategori[index]['sudah_daftar'] ? 'Sudah Daftar' : 'Belum Daftar'}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    fixedSize:
                                        MaterialStatePropertyAll(Size(100, 40)),
                                    backgroundColor: eventController
                                                .getListKategori[index]
                                            ['sudah_daftar']
                                        ? MaterialStatePropertyAll(
                                            Color.fromARGB(255, 88, 85, 85))
                                        : MaterialStatePropertyAll(
                                            Color.fromARGB(255, 175, 29, 29))),
                                onPressed: eventController
                                        .getListKategori[index]['sudah_daftar']
                                    ? () {}
                                    : () {
                                        eventController.daftarKategori(
                                            int.parse(eventController
                                                    .getListKategori[index]
                                                ['id_kategori']));
                                      },
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
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
  }
}
