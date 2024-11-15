// 모코코 키우기 게임 제작
// 모코코 키우기 게임을 제작하고, 레벨업을 할 수 있는 페이지를 제작한다.
// 레벨업을 할 때마다 모코코의 이미지가 바뀌고, 레벨업을 할 때마다 경험치가 증가한다.
// 레벨업을 할 때마다 경험치가 증가하고, 경험치가 100이 되면 레벨업을 할 수 있다.
import 'package:flutter/material.dart';

class MokokoLevelUpPage extends StatefulWidget {
  @override
  _MokokoLevelUpPageState createState() => _MokokoLevelUpPageState();
}

class _MokokoLevelUpPageState extends State<MokokoLevelUpPage> {
  int _level = 1;
  int _experience = 0;

  void _levelUp() {
    setState(() {
      _experience = 0;
      _level++;
    });
  }

  void _gainExperience(int exp) {
    setState(() {
      _experience += exp;
      if (_experience >= 100) {
        _levelUp();
      }
    });
  }

  String _getMokokoImage() {
    switch (_level) {
      case 1:
        return 'assets/mokoko_level1.png';
      case 2:
        return 'assets/mokoko_level2.png';
      case 3:
        return 'assets/mokoko_level3.png';
      default:
        return 'assets/mokoko_default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mokoko Level Up Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(_getMokokoImage()),
            Text('Level: $_level'),
            Text('Experience: $_experience / 100'),
            ElevatedButton(
              onPressed: () => _gainExperience(10),
              child: Text('Gain 10 Experience'),
            ),
          ],
        ),
      ),
    );
  }
}
