import 'package:flutter/material.dart';

class PBPPage extends StatefulWidget {
  const PBPPage({Key? key}) : super(key: key);
  

  @override
  _PBPPageState createState() => _PBPPageState();
}

class _PBPPageState extends State<PBPPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Card title 1'),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
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
                      child: const Text('ACTION 1'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
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
