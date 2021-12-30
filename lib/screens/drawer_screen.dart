import 'package:flutter/material.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/ask-a-mentor/ask_a_mentor_page.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/screens/jadwal_home.dart';
import 'package:mobile/screens/study-community/community_home.dart';
import 'package:mobile/screens/video-playlist/video_playlist_home.dart';
import 'package:mobile/screens/notes/notes_page.dart';

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
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/images/stu-do-list.png'),
          ),
          const Text(
            'Stu-do-list',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.home,
            title: "Home",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.article,
            title: "Agenda",
            onTilePressed: () {},
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.question_answer,
            title: "Ask a Mentor",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AskAMentorPage()),
              );
            },
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.pending_actions,
            title: "Jadwal Belajar Bareng",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JadwalBelajarBarengHome()),
              );
            },
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.sticky_note_2,
            title: "Notes",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotesPage()),
              );
            },
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.today,
            title: "Schedule Kuliah",
            onTilePressed: () {},
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.supervisor_account,
            title: "Study Communities",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CommunityHome()),
              );
            },
          ),
          const SizedBox(height: 20),
          DrawerListTile(
            iconData: Icons.perm_media,
            title: "Video Playlist",
            onTilePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoPlaylistHome()),
              );
            },
          ),
          const SizedBox(height: 20),
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
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
