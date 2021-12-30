import 'package:flutter/material.dart';
import 'package:mobile/screens/notes/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/notes/screens/add_notes.dart';

class NotesHome extends StatelessWidget {
  const NotesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);
    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
            title: Text('Notes',
                style: TextStyle(color: Colors.grey.shade200)),
            backgroundColor: const Color(0xFF212529),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Card(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: const NetworkImage(
                          'https://thumbs.gfycat.com/VaguePleasantAmericanindianhorse-max-1mb.gif'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text('Notes Stu-Do-List',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    subtitle: Text(
                        'Di sini, kamu dapat membagikan catatanmu dan mengakses catatan yang telah dibagikan pengguna lain.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                  ButtonBar(
                    buttonPadding: const EdgeInsets.only(left: 24),
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FormNotes()),
                            );
                          },
                          child: const Text('Bagikan Catatan'))
                    ],
                  )
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
          ),
          const SizedBox(height: 16),
          ListView.builder(
              shrinkWrap: true,
              itemCount: notesProvider.notes.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 28),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        ListTile(
                          title: Text(notesProvider.notes[index].matkul,
                              style: const TextStyle(fontSize: 16)),
                          tileColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 16.0),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(notesProvider.notes[index].topik,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16),
                          alignment: Alignment.centerLeft,
                          child: Text('Penulis: '+notesProvider.notes[index].penulis,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, left: 16),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            notesProvider.notes[index].keterangan,
                            style: const TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              child: Text(
                                notesProvider.notes[index].link,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 14),
                              ),
                              onTap: () =>
                                  launch(notesProvider.notes[index].link)),
                        ),
                        ButtonBar(
                          buttonPadding:
                              const EdgeInsets.only(right: 24, bottom: 24),
                          alignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.red, size: 30),
                              color: Colors.red.shade900,
                              onPressed: () {
                                notesProvider.deleteNotes(
                                    notesProvider.notes[index]);
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
        ]));
  }
}
