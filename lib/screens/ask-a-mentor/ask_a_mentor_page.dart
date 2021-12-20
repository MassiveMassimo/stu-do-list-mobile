import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/semua.dart';
import 'dart:math';

class AskAMentorPage extends StatefulWidget {
  const AskAMentorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AskAMentorPageState createState() => _AskAMentorPageState();
}

class _AskAMentorPageState extends State<AskAMentorPage> {
  
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xFF212529),
        ),
        body: PageView.builder(
          itemCount: 6,
          controller: PageController(viewportFraction: 1),
          itemBuilder: (_, i) {
            return Container(
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: SemuaPage(),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF212529),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.40),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              label: 'Semua',
              icon: Icon(Icons.view_stream_rounded),
              backgroundColor: Color(0xFF212529),
            ),
            BottomNavigationBarItem(
              label: 'Alin',
              icon: Icon(Icons.calculate),
              backgroundColor: Color(0xFF212529),
            ),
            BottomNavigationBarItem(
              label: 'MPPI',
              icon: Icon(Icons.history_edu),
              backgroundColor: Color(0xFF212529),
            ),
            BottomNavigationBarItem(
              label: 'PBP',
              icon: Icon(Icons.developer_mode),
              backgroundColor: Color(0xFF212529),
            ),
            BottomNavigationBarItem(
              label: 'SDA',
              icon: Icon(Icons.storage),
              backgroundColor: Color(0xFF212529),
            ),
            BottomNavigationBarItem(
              label: 'SOSI',
              icon: Icon(Icons.memory),
              backgroundColor: Color(0xFF212529),
            ),
          ],
        ));
  }
}
