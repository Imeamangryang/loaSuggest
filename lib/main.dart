import 'package:flutter/material.dart';
import 'package:loapetition/constants/nav_items.dart';
import 'package:loapetition/pages/authpage.dart';
import 'package:loapetition/pages/dashboardpage.dart';
import 'package:loapetition/pages/homepage.dart';
import 'package:loapetition/pages/suggestionpage.dart';
import 'package:loapetition/pages/suggestionwritepage.dart';
import 'package:loapetition/pages/surveypage.dart';

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
        '/${navItems[0]}': (context) =>
            const SuggestionPage(), // 건의사항페이지 suggestionpage.dart
        '/${navItems[1]}': (context) =>
            const SurveyPage(), // 설문하기페이지 surveypage.dart
        '/${navItems[2]}': (context) => const Servicios(), // 통계자료페이지
        '/${navItems[3]}': (context) => const Servicios(), // 마음의편지페이지
        '/${navItems[4]}': (context) => const Servicios(), // 정보공유페이지
        '/${navItems[5]}': (context) =>
            const AuthenticationPage(), // 로그인페이지 authpage.dart
        '/suggestion': (context) =>
            const SuggestionWritePage(), // 건의사항작성페이지 suggestionpage.dart
      },
    );
  }
}
