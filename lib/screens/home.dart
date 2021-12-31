import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'home_isi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: Image.asset("assets/images/stu-do-list.png", width: 50, height: 50),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 33, 37, 41),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/home_page.gif"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Isi(),
              ),
              SizedBox(height:500),
            ],
          ),
        ),
      ),
    );
    }
}