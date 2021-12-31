import 'package:mobile/screens/jadwal-belajar-bareng/providers/jadwal_provider.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/screens/jadwal_home.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/screens/page_tambah_isi.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TambahPage extends StatelessWidget {
  const TambahPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( 
      create: (context) => JadwalBelajarProvider(),
      child: MaterialApp(
        title: 'Stu-do-list',
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const _TambahPage(),
      ),
    );
  }
}

class _TambahPage extends StatelessWidget {
  const _TambahPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Jadwal Belajar Bareng'),
        backgroundColor: const Color.fromARGB(255, 33, 37, 41),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/BerhasilPage.gif"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.purple.shade900.withOpacity(0.6), BlendMode.darken),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: BerhasilDitambah(),
              ),
              MaterialButton(
                color: const Color.fromARGB(255, 11, 94, 215),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JadwalBelajarBarengHome()),
                    );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: Text(
                    "Kembali",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height:500),
            ],
          ),
        ),
      ),
    );
  }
}
