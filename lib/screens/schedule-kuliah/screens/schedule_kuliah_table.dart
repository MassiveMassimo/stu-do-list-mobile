import 'package:flutter/material.dart';
import 'package:mobile/screens/schedule-kuliah/providers/schedule_kuliah_providers.dart';
import 'package:mobile/screens/schedule-kuliah/screens/add_jadwal.dart';
import 'package:mobile/screens/schedule-kuliah/screens/add_matkul.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/study-community/screens/add_study_community.dart';

class ScheduleKuliahPage extends StatelessWidget {
  const ScheduleKuliahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScheduleKuliahProvider>(context);

    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
            title: Text('Schedule Kuliah',
                style: TextStyle(color: Colors.grey.shade200)),
            backgroundColor: const Color(0xFF212529),
            actions: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 30),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormAddMatkul()),
                  );
                },
              )
            ]),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Card(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
              height: 225,
              // width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: const NetworkImage(
                          'https://64.media.tumblr.com/d14995c11b9f3b9c94347e3b5d790d24/babbd570ca3d6c19-f3/s500x750/5fd44a8447f25e68a4da3740b06c65adc597bcea.gifv'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text('Schedule Kuliah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    subtitle: Text(
                        'Dengan fitur ini, kamu dapat memasukkan jadwal perkuliahan mingguan untuk setiap mata kuliah yang kamu ambil. Yuk, dicoba!',
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
                              MaterialPageRoute(
                                  builder: (context) => FormAddMatkul()),
                            );
                          },
                          child: const Text('Tambah Matkul'))
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
          const SizedBox(
            height: 40,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: provider.jadwalMatkuls.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                        provider.jadwalMatkuls[index].matkul.nama +
                            " " +
                            provider.jadwalMatkuls[index].matkul.kelas +
                            " (" +
                            provider.jadwalMatkuls[index].matkul.sks
                                .toString() +
                            ")",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    ButtonBar(
                      buttonPadding: const EdgeInsets.only(left: 24),
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormAddJadwal(
                                        matkulId: provider
                                            .jadwalMatkuls[index].matkul.id)),
                              );
                            },
                            child: const Text('Tambah Jadwal')),
                        ElevatedButton(
                            onPressed: () {
                              provider.deleteMatkul(
                                  provider.jadwalMatkuls[index].matkul.id);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            child: const Text('Hapus Matkul'))
                      ],
                    ),
                    DataTable(
                        columns: [
                          DataColumn(
                              label: Text('No',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Hari',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Jam',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: provider.jadwalMatkuls[index].jadwals
                            .asMap()
                            .entries
                            .map((e) {
                          return DataRow(cells: [
                            DataCell(Text((e.key + 1).toString())),
                            DataCell(Text(e.value.hari)),
                            DataCell(Text(e.value.start + " - " + e.value.end)),
                          ]);
                        }).toList()),
                    const SizedBox(height: 32),
                  ]);
            },
          ),
        ]));
  }
}
