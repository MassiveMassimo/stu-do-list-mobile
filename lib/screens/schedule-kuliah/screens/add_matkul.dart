import 'package:mobile/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/schedule-kuliah/models/matkul.dart';
import 'package:mobile/screens/schedule-kuliah/providers/schedule_kuliah_providers.dart';
import 'package:mobile/screens/schedule-kuliah/screens/add_jadwal.dart';
import 'package:provider/provider.dart';

class FormAddMatkul extends StatefulWidget {
  @override
  _FormAddMatkulState createState() => _FormAddMatkulState();
}

class _FormAddMatkulState extends State<FormAddMatkul> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? nama;
  final kelas = TextEditingController();
  final sks = TextEditingController();

  void onAdd() async {
    final String namaadd = nama!;
    final String kelasadd = kelas.text;
    final String sksadd = sks.text;
    if (namaadd.isNotEmpty && kelasadd.isNotEmpty && sksadd.isNotEmpty) {
      final Matkul matkul =
          Matkul(nama: namaadd, kelas: kelasadd, sks: int.parse(sksadd));

      Matkul matkulCreated =
          await Provider.of<ScheduleKuliahProvider>(context, listen: false)
              .addMatkul(matkul);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FormAddJadwal(matkulId: matkulCreated.id)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          title: Text('Schedule Kuliah',
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
                    child: Text("Tambah Matkul",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        labelText: 'Pilih Mata Kuliah',
                        border: OutlineInputBorder()),
                    value: nama,
                    items: ['Alin', 'MPPI', 'PBP', 'SOSI', 'SDA']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => nama = value!);
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
                        hintText: "Masukkan kelas, contoh: A",
                        labelText: "Kelas",
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
                      controller: sks,
                      decoration: const InputDecoration(
                        hintText: "Masukkan sks, contoh: 4",
                        labelText: "Sks",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Sks tidak boleh kosong";
                        }
                      }),
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
