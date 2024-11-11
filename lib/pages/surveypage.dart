import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('설문하기'),
            // survey form
            const TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '대표캐릭터명',
              ),
            ),
            const TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '서버명',
              ),
            ),
            const TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이메일',
              ),
            ),
            const TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '연락처',
              ),
            ),
            const TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '설문내용',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('제출하기'),
            ),
          ],
        ),
      ),
    );
  }
}
