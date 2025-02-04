import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

class StatisticsmainPage extends StatefulWidget {
  const StatisticsmainPage({super.key});

  @override
  State<StatisticsmainPage> createState() => _StatisticsmainPageState();
}

class _StatisticsmainPageState extends State<StatisticsmainPage> {
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
