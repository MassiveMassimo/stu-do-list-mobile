import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/semua.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/alin.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/mppi.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/pbp.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/sda.dart';
import 'package:mobile/screens/ask-a-mentor/widgets/sosi.dart';
import 'dart:math';

class AskAMentorPage extends StatefulWidget {
  const AskAMentorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AskAMentorPageState createState() => _AskAMentorPageState();
}

class _AskAMentorPageState extends State<AskAMentorPage> {
  int currentIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xFF212529),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) => setState(() => currentIndex = index),
          children: const <Widget>[
            SemuaPage(),
            AlinPage(),
            MPPIPage(),
            PBPPage(),
            SDAPage(),
            SOSIPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF212529),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.40),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);
            bottomTapped(index);
          },
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
