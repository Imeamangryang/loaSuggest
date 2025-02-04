import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

class UpdatemainPage extends StatefulWidget {
  const UpdatemainPage({super.key});

  @override
  State<UpdatemainPage> createState() => _UpdatemainPageState();
}

class _UpdatemainPageState extends State<UpdatemainPage> {
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
