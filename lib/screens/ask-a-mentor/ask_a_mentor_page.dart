import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/ask-a-mentor/providers/post_provider.dart';
import 'package:mobile/screens/ask-a-mentor/ask_a_mentor_home.dart';

class AskAMentorPage extends StatelessWidget {
  const AskAMentorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MaterialApp(
        title: 'Ask a Mentor - Stu-do-list',
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const AskAMentorHome(),
      ),
    );
  }
}
