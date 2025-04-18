import 'package:flutter/material.dart';
import 'package:loapetition/constants/color_transform.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor.fromHex('#003366'),
      height: 75,
      child: const Center(
          child: MouseRegion(
        cursor: SystemMouseCursors.text,
        child: Text(
          'Copyright 2022 Todos los derechos reservados | Rootdev Company | David, Chiriquí, Panamá',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}
