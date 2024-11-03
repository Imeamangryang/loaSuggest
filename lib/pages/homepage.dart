import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapetition/constants/colors.dart';
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
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.center,
                    children: [
                      SizedBox(
                        width: (width > 768 ? width / 3 : width),
                        child: Column(
                          children: [
                            Text(
                              'Aplicaciones mbviles',
                              style: GoogleFonts.andika(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Desarrollamos tu idea móvil tanto para Android como iOS y la construimos en aplicaciones móviles seguras, ligeras ademas de un diseño encantador.',
                              style: GoogleFonts.andika(fontSize: 20),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (width > 768 ? width / 3 : width),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Image.asset(
                              'assets/android-logo.png',
                              width: 200,
                            )),
                            Flexible(
                                child: Image.asset(
                              'assets/ios-logo.png',
                              width: 200,
                            )),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runAlignment: WrapAlignment.spaceEvenly,
                      runSpacing: 100,
                      spacing: 100,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              const Icon(Icons.design_services, color: Colors.orange, size: 40),
                              Text(
                                'Diseños',
                                style:
                                    GoogleFonts.andika(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title: Text(
                                  'Experiencia de usuario',
                                  style: GoogleFonts.andika(fontSize: 20),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title: Text('Interfaz de usuario',
                                    style: GoogleFonts.andika(fontSize: 20)),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title: Text('Animaciones', style: GoogleFonts.andika(fontSize: 20)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.memory,
                                color: Colors.cyan,
                                size: 40,
                              ),
                              Text(
                                'Performance',
                                style:
                                    GoogleFonts.andika(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title:
                                    Text('Notificaciones', style: GoogleFonts.andika(fontSize: 20)),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title:
                                    Text('Automatización', style: GoogleFonts.andika(fontSize: 20)),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title:
                                    Text('Escalabilidad', style: GoogleFonts.andika(fontSize: 20)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
