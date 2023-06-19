import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/controller/history_controller.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF001431),
          title: Text('History'),
        ),
        body: Obx(() {
          if (historyController.getIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount:
                historyController.getListHistory.length, // Jumlah item history
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          historyController.getListHistory[index][
                              'gambar_poster'], // Ubah dengan path gambar yang sesuai
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        '${historyController.getListHistory[index]['nama_event']}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${historyController.getListHistory[index]['nama_kategori']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              'Tanggal Pendaftaran: ${historyController.getListHistory[index]['tanggal']}'),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // Warna garis bawah
                      thickness: 1, // Ketebalan garis bawah
                    ),
                  ],
                ),
              );
            },
          );
        }));
  }
}
