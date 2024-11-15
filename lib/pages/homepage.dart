import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapetition/widgets/item.dart';
import 'package:loapetition/widgets/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      child: Image.asset(
                          'images/LOSTARK_wallpaper_3440x1440_Season3.jpg')),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 75, horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Wanted LOA',
                                    style: GoogleFonts.andika(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '로스트아크 건의 및 여론 조사',
                                    style: GoogleFonts.andika(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.grey),
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
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal, // 나열 방향
                    alignment: WrapAlignment.center, // 정렬 방식
                    spacing: 25, // 좌우 간격
                    runSpacing: 5, // 상하 간격
                    children: [ItemCard(), ItemCard(), ItemCard()],
                  ),
                )),
            Container(
              color: Colors.white,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
