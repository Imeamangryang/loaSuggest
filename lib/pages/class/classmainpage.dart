import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapetition/pages/class/classsurveypage.dart';
import 'package:loapetition/widgets/layout.dart';

var accessToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyIsImtpZCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyJ9.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDA1Njc2OTUifQ.HOzFbR2gG8RhNvobi3fds5hYBaEi1k55riqT_I609ZRjXAEKLwMK6VkinDXKxRtp4ZouDX54-viGDh32DVquQ6cC-kVPoB6IZstJ6dH5CqMbaJ8cv0TDBY4MR6lf__bN0xBRTyRodF5Ra07_9a_n0cMssEvpJSJ7ofMwAo_313dEHHXyyFw0xM8feYDKNcI574BDmLn_qvSs8pb6bddRSituFAFL-3onHWB5-BQSSezsH8eHOsHzcj5moHic6RgYanfn13FdpzIcdIkA-dn0cdYxK6iXVh5HJkVgowZDWGW8vFb3xiMWJGyl5_FUJCMwYKFjzUPVo9h750NEP9tz8Q';

// ignore: camel_case_types
class classmainPage extends StatefulWidget {
  const classmainPage({super.key});

  @override
  State<classmainPage> createState() => _classmainPageState();
}

// ignore: camel_case_types
class _classmainPageState extends State<classmainPage> {
  String _characterName = '';
  dynamic _data = '';
  List<Map<String, dynamic>> _characters = [];

  Future<void> fetchCharacterInfo() async {
    final apiUrl = 'https://developer-lostark.game.onstove.com/characters/$_characterName/siblings';
    final headers = {
      "Content-Type": "application/json;charset-UTF-8",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken"
    };

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>; // Cast to List<dynamic>
        setState(() {
          _characters = data.cast<Map<String, dynamic>>(); // Convert to List<Map<String, dynamic>>
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
    final width = MediaQuery.of(context).size.width;
    return CustomLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                          stops: [0.3, 0.8],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset('images/LOSTARK_wallpaper_3440x1440_Season3.jpg')),
                  Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: (width > 768 ? width / 2 : width),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '클래스 만족도 조사',
                                    style: GoogleFonts.andika(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '1640 이상의 캐릭터만 참여 가능합니다.',
                                    style: GoogleFonts.andika(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.grey[300]),
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: const SizedBox(height: 20),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  color: Colors.white,
                  width: width > 768 ? width / 2 : width * 0.8,
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '대표캐릭터명',
                            fillColor: Colors.white,
                            filled: true,
                            hoverColor: Colors.white),
                        onChanged: (value) {
                          _characterName = value;
                        },
                        onSubmitted: (value) {
                          _characterName = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: fetchCharacterInfo,
                        child: const Text('정보 불러오기'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: _characters.isEmpty
                  ? Text(_data)
                  : ListView.builder(
                      // Use ListView.builder for scrollable list
                      shrinkWrap: true, // Wrap content to avoid unnecessary space
                      itemCount: _characters.length,
                      itemBuilder: (context, index) {
                        final character = _characters[index];
                        final itemMaxLevel =
                            double.tryParse(character['ItemMaxLevel'].replaceAll(',', '')) ?? 0;
                        if (itemMaxLevel >= 1640) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0), // Added horizontal margin
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      '${character['ServerName']} - ${character['CharacterName']} - ${character['CharacterClassName']} - ${itemMaxLevel.toInt()}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SurveyPage(
                                            className: character['CharacterClassName'].toString(),
                                          ),
                                          settings: RouteSettings(
                                            name: '/${character['CharacterClassName']}',
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text('설문 참여'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox
                              .shrink(); // Return an empty widget if condition is not met
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
