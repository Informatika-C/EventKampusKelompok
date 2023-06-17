import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF001431),
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: 5, // Jumlah item history
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
                    child: Image.asset(
                      'assets/images/desainweb.jpg', // Ubah dengan path gambar yang sesuai
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    'Nama Event ${index + 1}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Katgegori Lomba ${index + 1}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('Waktu: ${DateTime.now()}'),
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
      ),
    );
  }
}
