import 'package:flutter/material.dart';
import 'package:loapetition/constants/nav_items.dart';
import 'package:loapetition/pages/authpage.dart';
import 'package:loapetition/pages/class/classmainpage.dart';
import 'package:loapetition/pages/contents/contentsmainpage.dart';
import 'package:loapetition/pages/dashboardpage.dart';
import 'package:loapetition/pages/homepage.dart';
import 'package:loapetition/pages/statistics/statisticsmainpage.dart';
import 'package:loapetition/pages/update/updatemainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LostArk Petition',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(), // 홈페이지
        '/${navItems[0]}': (context) => const classmainPage(), // 클래스설문페이지 classmainpage.dart
        '/${navItems[1]}': (context) => const ContentsmainPage(), // 콘텐츠설문페이지 contentsmainpage.dart
        '/${navItems[2]}': (context) => const UpdatemainPage(), // 업데이트설문페이지 updatemainpage.dart
        '/${navItems[3]}': (context) =>
            const StatisticsmainPage(), // 통계자료페이지 statisticsmainpage.dart
      },
    );
  }
}
