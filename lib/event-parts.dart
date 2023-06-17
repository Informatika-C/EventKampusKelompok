import 'package:flutter/material.dart';

class BottomSheetWidget {
  static Widget showBottomSheet(BuildContext context) {
    return BottomSheet(
      onClosing: () {}, // Aksi ketika bottom sheet ditutup
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
                  'Seminar Pendidikan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        selectedColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        title: Text('Item ${index + 1}'),
                        subtitle: Text('10 Per 40 Orang'),
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
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                content: Container(
                                  width: 350.0,
                                  height: 450.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              child: Image.asset(
                                                  'assets/images/desainweb.jpg',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Container(
                                                margin: EdgeInsets.all(4),
                                                width: 300 * 0.5,
                                                child: Text(
                                                  "Desain Web",
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  "abdasdakjbdadab adubadbabudakbuaol ifa,fjbakbakf kefakfakfafu vkafakfevajfakvfuavfakuf kavkfvakufvaufuafuauvkf faegksf eufkabfa",
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Cabang Perlombaan',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Tanggal Pendaftaran',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Tanggal Mulai',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Tanggal Penyisihan',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Tanggal Final',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Status Pendaftaran',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
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
                                                        ':  Protek svhkabs kvjabva hbvakjbh',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 145,
                                                      child: Text(
                                                        ':  Desain Web',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Text(
                                                      ':  01-05-2023',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      ':  10-05-2023',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      ':  15-05-2023',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      ':  20-05-2023',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      ':  ? terdaftar : -',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
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
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(100, 40)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromARGB(
                                                    255, 175, 29, 29))),
                                    onPressed: () {},
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
      },
    );
  }
}
