import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

class ContentsmainPage extends StatefulWidget {
  const ContentsmainPage({super.key});

  @override
  State<ContentsmainPage> createState() => _ContentsmainPageState();
}

class _ContentsmainPageState extends State<ContentsmainPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomLayout(
      child: Center(
        child: Text(
          '아직 준비중입니다',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
