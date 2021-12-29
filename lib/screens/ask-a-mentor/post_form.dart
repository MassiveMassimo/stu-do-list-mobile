import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/ask-a-mentor/ask_a_mentor_page.dart';

class PostForm extends StatefulWidget {
  const PostForm({ Key? key }) : super(key: key);

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Tambah Post"),
        backgroundColor: Color(0xFF212529),
      ),
      body: const Center(
        child: Text("hello world"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [Icon(Icons.add), Text('Tambah')],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AskAMentorPage()),
          );
        },
        tooltip: 'Tambah Post',
      ),
    );
  }
}