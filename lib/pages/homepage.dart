import 'package:flutter/material.dart';
import 'package:loapetition/constants/colors.dart';
import 'package:loapetition/constants/nav_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.scaffoldColor,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // MAIN
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLightColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  const Text(
                    '  LostArk 여론 조사',
                    style: TextStyle(
                      color: CustomColor.whitePrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  for (var i = 0; i < navItems.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: () {}, child: Text(navItems[i])),
                    ),
                ],
              ),
            ),
            // SKILL
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.deepPurple,
            ),
            // PROJECTS
            const SizedBox(
              height: 500,
              width: double.maxFinite,
            ),
          ],
        ));
  }
}
