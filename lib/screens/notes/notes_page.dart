import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/notes/providers/notes_provider.dart';
import 'package:mobile/screens/notes/screens/notes_home.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const MaterialApp(
        title: 'Notes - Stu-Do-List',
        home: NotesHome(),
      ),
    );
  }
}
