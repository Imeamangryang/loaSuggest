import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loapetition/widgets/layout.dart';

var accessToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyIsImtpZCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyJ9.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDA1Njc2OTUifQ.HOzFbR2gG8RhNvobi3fds5hYBaEi1k55riqT_I609ZRjXAEKLwMK6VkinDXKxRtp4ZouDX54-viGDh32DVquQ6cC-kVPoB6IZstJ6dH5CqMbaJ8cv0TDBY4MR6lf__bN0xBRTyRodF5Ra07_9a_n0cMssEvpJSJ7ofMwAo_313dEHHXyyFw0xM8feYDKNcI574BDmLn_qvSs8pb6bddRSituFAFL-3onHWB5-BQSSezsH8eHOsHzcj5moHic6RgYanfn13FdpzIcdIkA-dn0cdYxK6iXVh5HJkVgowZDWGW8vFb3xiMWJGyl5_FUJCMwYKFjzUPVo9h750NEP9tz8Q';

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({super.key});

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  String _characterName = '';
  dynamic _data = '';
  List<Map<String, dynamic>> _characters = [];

  Future<void> fetchCharacterInfo() async {
    final apiUrl =
        'https://developer-lostark.game.onstove.com/characters/${_characterName}/siblings';
    final headers = {
      "Content-Type": "application/json;charset-UTF-8",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken"
    };

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        final data =
            jsonDecode(response.body) as List<dynamic>; // Cast to List<dynamic>
        setState(() {
          _characters = data.cast<
              Map<String, dynamic>>(); // Convert to List<Map<String, dynamic>>
          _data = 'response: ${response.body}';
        });
      } else {
        setState(() {
          _data = 'Request failed with status: ${response.statusCode}.';
        });
      }
    } catch (e) {
      setState(() {
        _data = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('LostArk Api Test'),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '대표캐릭터명',
              ),
              onChanged: (value) {
                _characterName = value;
              },
              onSubmitted: (value) {
                _characterName = value;
              },
            ),
            TextButton(
              onPressed: fetchCharacterInfo,
              child: const Text('정보 불러오기'),
            ),
            const SizedBox(height: 20),
            _characters.isEmpty
                ? Text(_data)
                : ListView.builder(
                    // Use ListView.builder for scrollable list
                    shrinkWrap: true, // Wrap content to avoid unnecessary space
                    itemCount: _characters.length,
                    itemBuilder: (context, index) {
                      final character = _characters[index];
                      return ListTile(
                        title: SelectableText(
                          '${character['ServerName']} - ${character['CharacterName']} - ${character['CharacterClassName']} - ${character['ItemMaxLevel']}',
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class $ {}
