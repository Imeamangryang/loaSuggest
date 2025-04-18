import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loapetition/constants/NPC_dialog.dart';
import 'package:loapetition/widgets/layout.dart';

class ContentsmainPage extends StatefulWidget {
  const ContentsmainPage({super.key});

  @override
  State<ContentsmainPage> createState() => _ContentsmainPageState();
}

class _ContentsmainPageState extends State<ContentsmainPage> {
  int dialogindex = 0;

  void _showNicknameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your nickname'),
          content: TextField(
            onSubmitted: (String value) {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/Bg_RaidMain.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              'images/NPC2.png',
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        key: ValueKey<int>(dialogindex),
                        animatedTexts: [
                          TyperAnimatedText(NPC_dialog[dialogindex]),
                        ],
                        onTap: () {
                          setState(() {
                            if (dialogindex < NPC_dialog.length - 1) {
                              dialogindex++;
                            } else {
                              _showNicknameDialog(context);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (dialogindex < NPC_dialog.length - 1) {
                        dialogindex++;
                      } else {
                        _showNicknameDialog(context);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
