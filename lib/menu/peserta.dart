import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/controller/peserta_controller.dart';

class PesertaPage extends StatefulWidget {
  @override
  State<PesertaPage> createState() => _PesertaPageState();
}

class _PesertaPageState extends State<PesertaPage> {
  PesertaController pesertaController = Get.put(PesertaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF001431),
          title: Text('Daftar Peserta'),
        ),
        body: Obx(() {
          if (pesertaController.getIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: pesertaController.getListPeserta.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF001431),
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  '${pesertaController.getListPeserta[index]['username']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Email: ${pesertaController.getListPeserta[index]['email']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            },
          );
        }));
  }
}
