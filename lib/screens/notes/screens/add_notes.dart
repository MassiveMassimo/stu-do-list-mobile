import 'package:mobile/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/notes/providers/notes_provider.dart';
import 'package:mobile/screens/notes/screens/notes_home.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/notes/models/notes_model.dart';

class FormNotes extends StatefulWidget {
  const FormNotes({Key? key}) : super(key: key);

  @override
  _FormNotesState createState() => _FormNotesState();
}

class _FormNotesState extends State<FormNotes> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final penulis = TextEditingController();
  String? matkul;
  final topik = TextEditingController();
  final keterangan = TextEditingController();
  final link = TextEditingController();

  void onAdd() {
    final String penulisadd = penulis.text;
    final String matkuladd = matkul!;
    final String topikadd = topik.text;
    final String keteranganadd = keterangan.text;
    final String linkadd = link.text;
    if (matkuladd.isNotEmpty &&
        topikadd.isNotEmpty &&
        penulisadd.isNotEmpty &&
        keteranganadd.isNotEmpty &&
        linkadd.isNotEmpty) {
      final Notes notes = Notes(
        penulis: penulisadd,
        matkul: matkuladd,
        topik: topikadd,
        keterangan: keteranganadd,
        link: linkadd,
      );

      Provider.of<NotesProvider>(context, listen: false).addNotes(notes);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NotesHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: Text('Notes',
              style: TextStyle(color: Colors.grey.shade200)),
          backgroundColor: const Color(0xFF212529),
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
                    child: Text("Bagikan Catatan",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: penulis,
                      decoration: const InputDecoration(
                        hintText: "Masukkan nama penulis",
                        labelText: "Penulis",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Penulis tidak boleh kosong";
                        }
                      }),
                  const SizedBox(height: 16),
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
                        return "Mata kuliah tidak boleh kosong";
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: topik,
                      decoration: const InputDecoration(
                        hintText: "Masukkan topik catatan",
                        labelText: "Topik",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Kelas tidak boleh kosong";
                        }
                      }),

                  const SizedBox(height: 16),
                  TextFormField(
                      controller: keterangan,
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
                        labelText: "URL Notes ",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "URL tidak boleh kosong";
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
                          child: const Text('Bagikan'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent.shade400))
                    ],
                  )
                ]),
          ),
        ));
  }
}
