import 'package:flutter/material.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/ask-a-mentor/ask_a_mentor_page.dart';
import 'package:mobile/screens/study-community/community_home.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Name"),
            accountEmail: Text("email@ui.ac.id"),
          ),
          DrawerListTile(
            iconData: Icons.home,
            title: "Home",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          DrawerListTile(
            iconData: Icons.article,
            title: "Agenda",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.question_answer,
            title: "Ask a Mentor",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AskAMentorPage()),
              );
            },
          ),
          DrawerListTile(
            iconData: Icons.pending_actions,
            title: "Jadwal Belajar Bareng",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.sticky_note_2,
            title: "Notes",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.today,
            title: "Schedule Kuliah",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.supervisor_account,
            title: "Study Communities",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityHome()),
              );
            },
          ),
          DrawerListTile(
            iconData: Icons.perm_media,
            title: "Video Playlist",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.logout,
            title: "Log Out",
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;
  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
