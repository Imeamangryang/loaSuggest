import 'package:flutter/material.dart';
import 'package:loapetition/constants/nav_items.dart';
import 'package:loapetition/pages/dashboardpage.dart';
import 'package:loapetition/pages/homepage.dart';

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
        '/': (context) => const HomePage(),
        for (int i = 0; i < navItems.length; i++) '/${navItems[i]}': (context) => const Servicios(),
      },
    );
  }
}
