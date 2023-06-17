import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/token.dart';


class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String _idEvent = '';
  String _namaEvent = '';
  String _tipe = '';
  String _keterangan = '';
  String _tanggal = '';
  String _tempat = '';
  String _penanggungJawab = '';
  File? _gambarPoster;
  File? _gambarBanner;

  Future<void> _selectImage(String field) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (field == 'poster') {
          _gambarPoster = File(pickedFile.path);
        } else if (field == 'banner') {
          _gambarBanner = File(pickedFile.path);
        }
      });
    }
  }

  final List<String> _options = [
    'Akademik',
    'Non-Akademik',
  ];

  var _selectedOption = null;

  Future<void> submitEvent() async {
    // Membuat objek request multipart
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://'));

    // Menambahkan field data event ke request
    // request.fields['id_event'] = _idEvent;
    request.fields['nama_event'] = _namaEvent;
    request.fields['tipe'] = _tipe;
    request.fields['keterangan'] = _keterangan;
    request.fields['tanggal'] = _tanggal;
    request.fields['tempat'] = _tempat;
    request.fields['penanggung_jawab'] = _penanggungJawab;

    // Menambahkan file gambar poster ke request
    if (_gambarPoster != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'gambar_poster', _gambarPoster!.path));
    } else {
      request.fields['gambar_poster'] = '-';
    }

    // Menambahkan file gambar banner ke request jika ada
    if (_gambarBanner != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'gambar_banner', _gambarBanner!.path));
    } else {
      request.fields['gambar_banner'] = '-';
    }

    // Mendapatkan token
    String? token = await Token.getToken();
      if (token == null) {
        token = '';
      }
    // Menambahkan token ke header request
    request.headers['Authorization'] = 'Bearer $token';

    // Mengirim request ke API
    var response = await request.send();

    // Mengecek kode status response
    if (response.statusCode == 200) {
      // Request berhasil, lakukan sesuatu
      print('Event submitted successfully');
    } else {
      // Request gagal, lakukan sesuatu
      print('Failed to submit event');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 3, 46),
        title: Text('Tambah Event'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'ID Event'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'ID Event harus diisi';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) {
              //     _idEvent = value!;
              //   },
              // ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Event'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Event harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _namaEvent = value!;
                },
              ),
              // Tambahkan TextFormField lainnya sesuai dengan field yang diperlukan
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Tipe'),
                items: _options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih tipe event';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                onSaved: (value) {
                  _tipe = value!;
                },
                value: _selectedOption,
              ),
              // Tambahkan TextFormField dan DropdownButtonFormField lainnya sesuai dengan field yang diperlukan
              TextFormField(
                decoration: InputDecoration(labelText: 'Keterangan'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Keterangan Harus Di isi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _keterangan = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal'),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      _tanggal = selectedDate
                          .toString(); // Atur nilai tanggal yang dipilih
                    });
                  }
                },
                readOnly:
                    true, // Field tidak bisa diubah secara manual, hanya dapat dipilih melalui DatePicker
                controller: TextEditingController(
                    text: _tanggal), // Atur nilai awal field tanggal
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pilih tanggal';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tanggal = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tempat'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tempat harus di isi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tempat = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Pj'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Pj harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _penanggungJawab = value!;
                },
              ),
              Row(
                children: [
                  Text("Chose File"),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _selectImage('poster');
                    },
                    child: Text("Poster"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Chose File"),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _selectImage('banner');
                    },
                    child: Text("Banner"),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();


                    _formKey.currentState!.reset();
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
