import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'form_add_video_page.dart';

class FormAddVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormAddVideoState();
  }
}

class FormAddVideoState extends State<FormAddVideo> {
  String? title = '';
  String? link = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> submit(BuildContext context) async {
    final response = await http.post(
        Uri.parse(
            'https://stu-do-list.herokuapp.com/video-playlist/video-flutter'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'link': link,
        }));
    print(response.body);
  }

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "1 A.M Study Session 📚 - [lofi hip hop/chill beats]",
        labelText: "Masukkan judul",
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Judul tidak boleh kosong';
        }
        return null;
      },
      onSaved: (String? value) {
        title = value!;
      },
    );
  }

  Widget _buildURL() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "http://video.mp4",
        labelText: "Masukkan tautan",
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
      keyboardType: TextInputType.url,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Tautan tidak boleh kosong';
        }
        return null;
      },
      onSaved: (String? value) {
        link = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTitle(),
            SizedBox(height: 50),
            _buildURL(),
            SizedBox(height: 50),
            MaterialButton(
              color: Color.fromARGB(255, 11, 94, 215),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Text(
                'Tambah',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();
                print(title);
                print(link);
                submit(context);
                showAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FormAddPage()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Selamat!"),
    content: Text('Video berhasil ditambahkan!'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
