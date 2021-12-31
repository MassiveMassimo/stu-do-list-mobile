import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/models/jadwal_model.dart';
import 'edit_form.dart';

class FormEditPage extends StatelessWidget {
  final JadwalBelajarModel jadwalbelajar;
  const FormEditPage({Key? key, required this.jadwalbelajar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Jadwal Belajar Bareng'),
        backgroundColor: const Color.fromARGB(255, 33, 37, 41),
      ),
      body:
          SingleChildScrollView(
        child: Column(
          children: <Widget> [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Buat Jadwal Belajar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            FormEdit(jadwalbelajar: jadwalbelajar)
          ],
        ),
      ),
    );
  }
}
