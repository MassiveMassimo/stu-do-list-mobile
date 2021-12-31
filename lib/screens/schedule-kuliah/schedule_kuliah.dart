import 'package:mobile/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/screens/schedule-kuliah/providers/schedule_kuliah_providers.dart';
import 'package:mobile/screens/schedule-kuliah/screens/schedule_kuliah_table.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/study-community/providers/community_provider.dart';
import 'package:mobile/screens/home.dart';

class ScheduleKuliah extends StatelessWidget {
  const ScheduleKuliah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScheduleKuliahProvider(),
      child: const MaterialApp(
        title: 'Schedule Kuliah',
        home: ScheduleKuliahPage(),
      ),
    );
  }
}
