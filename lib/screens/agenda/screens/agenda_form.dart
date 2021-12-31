import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../models/agenda_models.dart';
import 'package:mobile/screens/drawer_screen.dart';

class Matkul {
  const Matkul(this.name, this.value);
  final String name;
  final String value;
}

List<Matkul> namaMatkul = <Matkul>[
  const Matkul('Aljabar Linear', 'Alin'),
  const Matkul('Metodologi Penelitian dan Penulisan Ilmiah', 'MPPI'),
  const Matkul('Sistem Operasi', 'OS'),
  const Matkul('Pemrograman Berbasis Platform', 'PBP'),
  const Matkul('Struktur Data dan Algoritma', 'SDA'),
];

String _namaMatkul = "";
String _namaTugas = "";
String _tenggatTanggal = "";
String _tenggatWaktu = "";
String _keterangan = "";

Future<void> submit(BuildContext context) async {
  final response = await http.post(
      Uri.parse('https://stu-do-list.herokuapp.com/agenda/flutter-add'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'matkul': _namaMatkul,
        'judul': _namaTugas,
        'tanggal': _tenggatTanggal,
        'waktu': _tenggatWaktu,
        'keterangan': _keterangan,
      }));
  print(response.body);
}

// Buat debugging
void printHasil(BuildContext context) {
  print("Nama Matkul : " + _namaMatkul);
  print("Nama Keperluan : " + _namaTugas);
  print("Tenggat Waktu : " + _tenggatTanggal + " - " + _tenggatWaktu);
  print("Keterangan : " + _keterangan + '\n');
}

// Create a Form widget.
class AgendaForm extends StatefulWidget {
  const AgendaForm({Key? key}) : super(key: key);

  @override
  AgendaFormState createState() {
    return AgendaFormState();
  }
}

class AgendaFormState extends State<AgendaForm> {
  final _formKey = GlobalKey<FormState>();

  Matkul? selectedUser;
  DateTime? _datePicked;
  TimeOfDay? _timePicked;

  // Source : https://flutteragency.com/format-datetime-in-flutter/
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var timeFormat = DateFormat("kk:mm");

  TextEditingController _tanggalController = new TextEditingController();
  TextEditingController _waktuController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda - Form'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      // Sidebar menu
      // https://api.flutter.dev/flutter/material/Drawer-class.html
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    // Judul
                    const Text(
                      "Tambah Agenda",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Field Nama Mata Kuliah
                          const SizedBox(height: 40),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: Text(
                              "Nama Mata Kuliah",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: DropdownButtonFormField<Matkul>(
                              hint: Text("Pilih Mata Kuliah"),
                              value: selectedUser,
                              onChanged: (Matkul? Value) {
                                setState(() {
                                  selectedUser = Value!;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  setState(() => _namaMatkul = "Kosong");
                                  return 'Tolong Dipilih';
                                }
                                setState(() => _namaMatkul = value.value);
                                return null;
                              },
                              items: namaMatkul.map((Matkul matkul) {
                                return DropdownMenuItem<Matkul>(
                                  value: matkul,
                                  child: Row(
                                    children: <Widget>[
                                      // user.icon,
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        matkul.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          // Field Nama Keperluan
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: Text(
                              "Nama Keperluan",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                hintText: 'Contoh: Tugas Pemrograman 3',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() => _namaTugas = "Kosong");
                                  return 'Tolong Diisi';
                                }
                                setState(() => _namaTugas = value);
                                return null;
                              },
                            ),
                          ),

                          // Field Tenggat Waktu
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: Text(
                              "Tenggat Waktu",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                children: [
                                  // Field tenggat waktu
                                  // source : https://github.com/JohannesMilke/date_picker_example/blob/master/lib/widget/datetime_picker_widget.dart
                                  Flexible(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _tanggalController,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        _datePicked == null
                                                            ? DateTime.now()
                                                            : _datePicked!,
                                                    firstDate: DateTime(2019),
                                                    lastDate: DateTime(2028))
                                                .then((date) {
                                              setState(() {
                                                _datePicked = date!;
                                                _tanggalController.text =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(date);
                                              });
                                            });
                                          },
                                          icon: Icon(IconData(57634,
                                              fontFamily: 'MaterialIcons')),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        hintText: formattedDate,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong Dipilih';
                                        }
                                        setState(() => _tenggatTanggal = value);
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 20),

                                  // Field tenggat tanggal
                                  Flexible(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _waktuController,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showTimePicker(
                                              context: context,
                                              initialTime: _timePicked == null
                                                  ? TimeOfDay.now()
                                                  : _timePicked!,
                                            ).then((time) {
                                              setState(() {
                                                _timePicked = time!;
                                                // Source : https://stackoverflow.com/questions/57561585/flutter-convert-24-hour-format-to-12-hour-format?rq=1
                                                DateTime time24format =
                                                    DateFormat("hh:mm").parse(
                                                        _timePicked!.hour
                                                                .toString() +
                                                            ":" +
                                                            _timePicked!.minute
                                                                .toString());
                                                _waktuController.text =
                                                    timeFormat
                                                        .format(time24format);
                                              });
                                            });
                                          },
                                          icon: Icon(IconData(0xe556,
                                              fontFamily: 'MaterialIcons')),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        hintText: '23:55',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Tolong Dipilih';
                                        }
                                        setState(() => _tenggatWaktu = value);
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              )),

                          // Field keterangan tambahan
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: Text(
                              "Keterangan Tambahan",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                                hintText:
                                    'Keterangan tambahan di lembar soal tugas',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() => _keterangan = "Kosong");
                                  return 'Tolong Diisi';
                                }
                                setState(() => _keterangan = value);
                                return null;
                              },
                            ),
                          ),

                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text(
                                  'Batal',
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red.shade700),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  // Navigation : https://appdividend.com/2019/01/02/flutter-navigation-example-tutorial/
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(width: 10), // Jarak antarbutton
                              ElevatedButton(
                                child: const Text(
                                  'Tambah',
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.shade700),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  // If it's valid, get the value and print it to the console
                                  if (_formKey.currentState!.validate()) {
                                    printHasil(context);
                                    submit(context);
                                    Navigator.pop(context);
                                  } else {
                                    print('belom lengkap\n');
                                  }
                                },
                              ),
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
