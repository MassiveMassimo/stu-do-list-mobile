import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/auth/login_page.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/auth/auth.dart';

class CommunityHome extends StatelessWidget {
  const CommunityHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Komunitas Belajar - Stu-Do-List',
        home: LoginPage(),
      ),
    );
  }
}
