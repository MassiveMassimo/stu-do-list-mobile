import 'package:mobile/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/schedule-kuliah/models/jadwal.dart';
import 'package:mobile/screens/schedule-kuliah/models/matkul.dart';
import 'package:mobile/screens/schedule-kuliah/providers/schedule_kuliah_providers.dart';
import 'package:provider/provider.dart';

class FormAddJadwal extends StatefulWidget {
  final int? matkulId;

  const FormAddJadwal({Key? key, @required this.matkulId}) : super(key: key);

  @override
  _FormAddJadwalState createState() => _FormAddJadwalState();
}

class _FormAddJadwalState extends State<FormAddJadwal> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? matkulId;
  String? hari;
  final start = TextEditingController();
  final end = TextEditingController();

  void exit() {
    Navigator.of(context).pop(context);
  }

  void reset() {
    hari = null;
    start.clear();
    end.clear();
  }

  void onAdd() {
    final String hariadd = hari!;
    final String startadd = start.text;
    final String endadd = end.text;
    if (hariadd.isNotEmpty && startadd.isNotEmpty && endadd.isNotEmpty) {
      final Jadwal jadwal =
          Jadwal(matkul: matkulId, hari: hariadd, start: startadd, end: endadd);

      Provider.of<ScheduleKuliahProvider>(context, listen: false)
          .addJadwal(jadwal);

      reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() => matkulId = widget.matkulId);
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
                    child: Text("Tambah Jadwal",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        labelText: 'Pilih Hari', border: OutlineInputBorder()),
                    value: hari,
                    items: ["Senin", "Selasa", "Rabu", "Kamis", "Jumat"]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => hari = value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Hari tidak boleh kosong";
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: start,
                      decoration: const InputDecoration(
                        hintText: "Masukkan waktu mulai, contoh: 10:00:00",
                        labelText: "Start Time (hh:mm:ss)",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Start time tidak boleh kosong";
                        }
                      }),
                  const SizedBox(height: 16),
                  TextFormField(
                      controller: end,
                      decoration: const InputDecoration(
                        hintText: "Masukkan waktu berakhir, contoh: 10:00:00",
                        labelText: "End Time",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "End time tidak boleh kosong";
                        }
                      }),
                  ButtonBar(
                    buttonPadding: const EdgeInsets.only(right: 24, bottom: 24),
                    alignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          child: const Text("Kembali"),
                          onPressed: () {
                            exit();
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
