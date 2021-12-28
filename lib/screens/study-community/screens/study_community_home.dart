import 'package:flutter/material.dart';
import 'package:mobile/screens/study-community/providers/community_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/study-community/screens/add_study_community.dart';

class StudyCommunityPage extends StatelessWidget {
  const StudyCommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commProvider = Provider.of<CommunityProvider>(context);
    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
            title: Text('Komunitas Belajar',
                style: TextStyle(color: Colors.grey.shade200)),
            backgroundColor: const Color(0xFF212529),
            actions: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 30),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormKomunitas()),
                  );
                },
              )
            ]),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Card(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
              height: 225,
              // width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: const NetworkImage(
                          'https://cdnb.artstation.com/p/assets/images/images/024/858/699/original/pixel-jeff-divoom.gif?1583771904'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text('Komunitas Belajar Stu-Do-List',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                    subtitle: Text(
                        'Ayo bergabung ke dalam Server Discord kami untuk mendapatkan berbagai informasi terkait pembelajaran daring',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                  ButtonBar(
                    buttonPadding: const EdgeInsets.only(left: 24),
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            launch('https://discord.gg/kMtvNDBb');
                          },
                          child: const Text('Masuk'))
                    ],
                  )
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
          ),
          const SizedBox(height: 16),
          ListView.builder(
              shrinkWrap: true,
              itemCount: commProvider.communities.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 28),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        ListTile(
                          title: Text(commProvider.communities[index].nama,
                              style: const TextStyle(fontSize: 16)),
                          tileColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 16.0),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(commProvider.communities[index].kelas,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16),
                          alignment: Alignment.centerLeft,
                          child: Text(commProvider.communities[index].prodi,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, left: 16),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            commProvider.communities[index].info,
                            style: const TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              child: Text(
                                commProvider.communities[index].link,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 14),
                              ),
                              onTap: () =>
                                  launch(commProvider.communities[index].link)),
                        ),
                        ButtonBar(
                          buttonPadding:
                              const EdgeInsets.only(right: 24, bottom: 24),
                          alignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.red, size: 30),
                              color: Colors.red.shade900,
                              onPressed: () {
                                commProvider.deleteCommunity(
                                    commProvider.communities[index]);
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
        ]));
  }
}
