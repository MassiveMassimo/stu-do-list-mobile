import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './agenda_form.dart';
import '../models/agenda_models.dart';
import 'package:mobile/screens/drawer_screen.dart';

fetchData() async {
  List<AgendaModel> agendas = [];
  const url = 'https://stu-do-list.herokuapp.com/agenda/get';
  try {
    final response = await http.get(Uri.parse(url));
    final extractedData = jsonDecode(response.body);
    print(extractedData);
    print("");
    // return extractedData;
    // List<dynamic> extractedData = [];

    for (var agenda in extractedData) {
      Fields fields = Fields(
        matkul: agenda["fields"]["matkul"],
        judul: agenda["fields"]["judul"],
        tanggal: agenda["fields"]["tanggal"],
        waktu: agenda["fields"]["waktu"],
        keterangan: agenda["fields"]["keterangan"],
      );
      AgendaModel agendaModel =
          AgendaModel(model: agenda["model"], pk: agenda["pk"], fields: fields);
      agendas.add(agendaModel);
    }

    print(agendas);
    print("");
    return agendas;

    // Ketika ada error
  } catch (error) {
    print(error);
    return error;
  }
}

// deleteAgenda(int agenda_id) async {
//   final url = 'https://stu-do-list.herokuapp.com/agenda/delete/$agenda_id';
// }

class AgendaMain extends StatefulWidget {
  @override
  AgendaMainState createState() {
    return AgendaMainState();
  }
}

class AgendaMainState extends State<AgendaMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Stu-Do-List"),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),

      drawer: DrawerScreen(),

      // Body untuk isi card-card
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        // Header
        // https://educity.app/flutter/how-to-add-background-image-to-a-container-in-flutter
        Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://c.tenor.com/4ryx66tWEhcAAAAd/pixel-study.gif"),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Agenda",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 64.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Ada agenda apa hari ini?",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: const Text(
                    'Tambahkan Agenda',
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue.shade700),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    // Navigation : https://appdividend.com/2019/01/02/flutter-navigation-example-tutorial/
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgendaForm()),
                    );
                  },
                ),
              ],
            )),

        Card(
          elevation: 6,
          margin: const EdgeInsets.all(20.0),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: Colors.grey.shade300,
                title: const Text('PBP'),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Nama Tugas
                      Text(
                        'Proyek UAS',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),

                      // Tenggat Waktu
                      SizedBox(height: 10),
                      Text(
                        '31/12/2021 - 23.59',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),

                      // Keterangan tambahan
                      SizedBox(height: 10),
                      Text(
                        'Keterangaaaaannnnnn panjaaaaaaaaaaaaaaaaanggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Hapus',
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const SecondRoute()),
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
