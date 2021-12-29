import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';

import 'form_add_video.dart';

class FormAddPage extends StatelessWidget {
  //static const routeName = '/form-video';
  const FormAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text(
          'Video Playlist',
          style: TextStyle(
            color: Colors.grey.shade200,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 33, 37, 41),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Tambah Video",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            FormAddVideo()
          ],
        ),
      )),
    );
  }
}
