import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/ask-a-mentor/providers/post_provider.dart';

class SemuaPage extends StatefulWidget {
  const SemuaPage({Key? key}) : super(key: key);
  

  @override
  _SemuaPageState createState() => _SemuaPageState();
}

class _SemuaPageState extends State<SemuaPage> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: postProvider.posts.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(
                    postProvider.posts[index].title + "  |  " + postProvider.posts[index].matkul,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                  ),
                  subtitle: Text(
                    "Ditanya oleh " + postProvider.posts[index].username + " pada " + postProvider.posts[index].time,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    postProvider.posts[index].message,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('Komen'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('Lihat'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
