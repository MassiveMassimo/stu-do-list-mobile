import 'package:mobile/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/study-community/providers/community_provider.dart';
import 'package:mobile/screens/study-community/screens/study_community_home.dart';
import 'package:mobile/screens/study-community/screens/add_study_community.dart';
import 'package:mobile/screens/home.dart';

class CommunityHome extends StatelessWidget {
  const CommunityHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityProvider(),
      child: MaterialApp(
        title: 'Komunitas Belajar - Stu-Do-List',
        home: const StudyCommunityPage(),
      ),
    );
  }
}
