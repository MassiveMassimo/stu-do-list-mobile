import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './agenda_form.dart';
import '../models/agenda_models.dart';
import 'package:mobile/screens/drawer_screen.dart';

List<AgendaModel> agendas = [];
fetchData() async {
  const url = 'https://stu-do-list.herokuapp.com/agenda/get';
  try {
    final response = await http.get(Uri.parse(url));
    final extractedData = jsonDecode(response.body);
    // print(extractedData);
    // print("");
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

    // print(agendas);
    // print("");
    return agendas;

    // Ketika ada error
  } catch (error) {
    print(error);
    return error;
  }
}

// deleteAgenda(int index, int agenda_id) async {
//   final url = 'https://stu-do-list.herokuapp.com/agenda/delete/$agenda_id';
//   try {
//     final response = await http.delete(Uri.parse(url));

//     agendas.removeAt(index);

//   } catch (error) {
//     print(error);
//     return error;
//   }
// }

class AgendaMain extends StatefulWidget {
  @override
  AgendaMainState createState() {
    return AgendaMainState();
  }
}

class AgendaMainState extends State<AgendaMain> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await fetchData();

    setState(() {});
  }

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

        ListView.builder(
            shrinkWrap: true,
            itemCount: agendas.length,
            itemBuilder: (context, index) {
              return Column(children: [
                Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(20.0),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        tileColor: Colors.grey.shade300,
                        title: Text((agendas[index].fields)!.matkul),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama Tugas
                              Text(
                                agendas[index].fields!.judul,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),

                              // Tenggat Waktu
                              SizedBox(height: 10),
                              Text(
                                '${agendas[index].fields!.tanggal} - ${agendas[index].fields!.waktu}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),

                              // Keterangan tambahan
                              SizedBox(height: 10),
                              Text(
                                agendas[index].fields!.keterangan,
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
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              // deleteAgenda(index, agendas[index].pk!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]);
            }),
      ])),
    );
  }
}
