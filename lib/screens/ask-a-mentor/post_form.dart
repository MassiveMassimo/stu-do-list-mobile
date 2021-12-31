import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/ask-a-mentor/providers/post_provider.dart';
import 'package:mobile/screens/ask-a-mentor/models/post.dart';
import 'package:mobile/screens/ask-a-mentor/ask_a_mentor_page.dart';
import 'package:mobile/screens/ask-a-mentor/ask_a_mentor_home.dart';


class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _title = TextEditingController();
  final _matkul = TextEditingController();
  final _message = TextEditingController();
  final _time = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onAdd() {
    final String inputTitle = _title.text;
    final String inputMatkul = _matkul.text;
    final String inputMessage = _message.text;
    final String inputTime = _time.text;

    if (inputTitle.isNotEmpty &&
        inputMatkul.isNotEmpty &&
        inputMessage.isNotEmpty &&
        inputTime.isNotEmpty) {
      final Post _post = Post(
        username: "Anonymous",
        title: inputTitle,
        matkul: inputMatkul,
        message: inputMessage,
        time: inputTime,
      );
      Provider.of<PostProvider>(context, listen: false).addPost(_post);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AskAMentorHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Post"),
        backgroundColor: Color(0xFF212529),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Tambah Pertanyaan",
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _title,
                    decoration: InputDecoration(
                      hintText: "Silakan masukan judul pertanyaan Anda",
                      labelText: "Title",
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Judul tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _matkul,
                    decoration: InputDecoration(
                      hintText: "Silakan masukan mata kuliah pertanyaan Anda",
                      labelText: "Matkul",
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Matkul tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _message,
                    decoration: InputDecoration(
                      hintText: "Silakan masukan pertanyaan Anda",
                      labelText: "Pertanyaanmu",
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pertanyaanmu tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _time,
                    decoration: InputDecoration(
                      hintText: "Silakan masukan pertanyaan Anda",
                      labelText: "Time",
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Waktu tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [Icon(Icons.add), Text('Tambah Post')],
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pertanyaanmu berhasil ditambahkan!')),
            );
            onAdd();
          }
        },
        tooltip: 'Tambah Post',
      ),
    );
  }
}
