import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'jadwal_form.dart';

class FormAddPage extends StatelessWidget {
  static const routeName = '/form-video';
  const FormAddPage({Key? key}) : super(key: key);

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
          children: const [
            SizedBox(
              height: 50,
            ),
            Text(
              "Buat Jadwal Belajar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            FormAdd()
          ],
        ),
      ),
    );
  }
}
