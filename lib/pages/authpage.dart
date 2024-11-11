import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('LostArk Api Test'),
            // discod login button
            const TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '대표캐릭터명',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Login with Discord'),
            ),
          ],
        ),
      ),
    );
  }
}
