import 'package:mobile/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/study-community/providers/community_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/study-community/models/community.dart';

class FormKomunitas extends StatefulWidget {
  @override
  _FormKomunitasState createState() => _FormKomunitasState();
}

class _FormKomunitasState extends State<FormKomunitas> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? matkul;
  final kelas = TextEditingController();
  String? prodi;
  final info = TextEditingController();
  final link = TextEditingController();

  void onAdd() {
    final String matkuladd = matkul!;
    final String kelasadd = kelas.text;
    final String prodiadd = prodi!;
    final String infoadd = info.text;
    final String linkadd = link.text;
    if (matkuladd.isNotEmpty &&
        kelasadd.isNotEmpty &&
        prodiadd.isNotEmpty &&
        infoadd.isNotEmpty &&
        linkadd.isNotEmpty) {
      final Community com = Community(
        nama: matkuladd,
        kelas: kelasadd,
        prodi: prodiadd,
        info: infoadd,
        link: linkadd,
      );

      Provider.of<CommunityProvider>(context, listen: false).addCommunity(com);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          title: Text('Komunitas Belajar',
              style: TextStyle(color: Colors.grey.shade200)),
          backgroundColor: Color(0xFF212529),
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text("Tambah Komunitas Belajar",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        labelText: 'Pilih Mata Kuliah',
                        border: OutlineInputBorder()),
                    value: matkul,
                    items: [
                      'Aljabar Linear',
                      'Metodologi Penelitian dan Penulisan Ilmiah',
                      'Pemrograman Berbasis Platform',
                      'Struktur Data & Algoritma',
                      'Sistem Operasi untuk Sistem Informasi'
                    ]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => matkul = value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Matkul tidak boleh kosong";
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: kelas,
                      decoration: const InputDecoration(
                        hintText: "Masukkan kelas",
                        labelText: "Kelas ",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Kelas tidak boleh kosong";
                        }
                      }),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Pilih Program Studi',
                      border: OutlineInputBorder(),
                    ),
                    value: prodi,
                    items: [
                      'Ilmu Komputer',
                      'Sistem Informasi',
                      'Sistem Informasi & Ilmu Komputer'
                    ]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => prodi = value!);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: info,
                      decoration: const InputDecoration(
                        hintText: "Masukkan keterangan tambahan",
                        labelText: "Keterangan ",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Keterangan tidak boleh kosong";
                        }
                      }),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: link,
                      decoration: const InputDecoration(
                        hintText: "Masukkan situs dalam bentul URL",
                        labelText: "Situs Grup ",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Situs tidak boleh kosong";
                        }
                      }),
                  const SizedBox(height: 20),
                  ButtonBar(
                    buttonPadding: const EdgeInsets.only(right: 24, bottom: 24),
                    alignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          child: const Text("Batal"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                              primary: Colors.red,
                              side: const BorderSide(
                                  color: Colors.red, width: 1))),
                      ElevatedButton(
                          onPressed: onAdd,
                          child: const Text('Kirim'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent.shade400))
                    ],
                  )
                ]),
          ),
        ));
  }
}
