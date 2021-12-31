import 'package:mobile/screens/jadwal-belajar-bareng/providers/jadwal_provider.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/screens/tambah_jadwal.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/screens/jadwal_landing.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class JadwalBelajarBarengHome extends StatelessWidget {
  const JadwalBelajarBarengHome({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( 
      create: (context) => JadwalBelajarProvider(),
      child: MaterialApp(
        title: 'Stu-do-list',
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const _JadwalBelajarBarengHome(),
      ),
    );
  }
}

class _JadwalBelajarBarengHome extends StatelessWidget {
  const _JadwalBelajarBarengHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final jadwalProvider = Provider.of<JadwalBelajarProvider>(context);
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Jadwal Belajar Bareng'),
        backgroundColor: const Color.fromARGB(255, 33, 37, 41),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/JadwalHeader.gif"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: LandingPage(),
              ),
              MaterialButton(
                color: const Color.fromARGB(255, 11, 94, 215),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FormAddPage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: Text(
                    "Buat Jadwal",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    const Text(
                      "Jadwal Belajar Bareng",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Center(
                        child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: jadwalProvider.jadwal.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [ 
                                    Card(
                                      margin: const EdgeInsets.symmetric(horizontal: 15),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.grey.shade400, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                                        ListTile(
                                          title: Text(jadwalProvider.jadwal[index].matkul, style: const TextStyle(fontSize: 20)),
                                          tileColor: Colors.grey.shade200,
                                          contentPadding:
                                              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                                          trailing: IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () {
                                                jadwalProvider.hapusJadwal(
                                                  jadwalProvider.jadwal[index]
                                                );
                                              },
                                            ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16.0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(jadwalProvider.jadwal[index].topik,
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 10, left: 16.0),
                                          alignment: Alignment.centerLeft,
                                          child: Text('Prioritas: ' + jadwalProvider.jadwal[index].prioritas,
                                              style: TextStyle(color: Colors.deepPurple.shade800, fontWeight: FontWeight.bold, fontSize: 18)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 10, left: 16.0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(jadwalProvider.jadwal[index].info,
                                              style: TextStyle(color: Colors.grey.shade800, fontSize: 18)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 12, left: 16.0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Dilaksanakan pada ' + jadwalProvider.jadwal[index].waktu,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 18),
                                          ),
                                        ),
                                        MaterialButton(
                                              color: const Color.fromARGB(255, 11, 94, 215),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                              onPressed: () => launch(jadwalProvider.jadwal[index].link),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10, horizontal: 8),
                                                child: Text(
                                                  "Ikut Pertemuan",
                                                  style: TextStyle(color: Colors.white, fontSize: 17),
                                                  
                                                ),
                                              ),
                                            ),
                                        const SizedBox(height: 16),
                                      ]),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              }
                            ),
              
                    

                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
