import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapetition/constants/colors.dart';
import 'package:loapetition/constants/nav_items.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: CustomColor.whitePrimaryColor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        // nav_items에 대한 라우트
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/${navItems[0]}');
            },
            child: Text('건의사항',
                style: GoogleFonts.blackHanSans(
                    fontSize: 20, color: CustomColor.whitePrimaryColor))),
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/${navItems[1]}');
            },
            child: Text('설문하기',
                style: GoogleFonts.blackHanSans(
                    fontSize: 20, color: CustomColor.whitePrimaryColor))),
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/${navItems[2]}');
            },
            child: Text('통계자료',
                style: GoogleFonts.blackHanSans(
                    fontSize: 20, color: CustomColor.whitePrimaryColor))),
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/${navItems[3]}');
            },
            child: Text('마음의편지',
                style: GoogleFonts.blackHanSans(
                    fontSize: 20, color: CustomColor.whitePrimaryColor))),
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            child: Text('WLOA',
                style: GoogleFonts.blackHanSans(
                    fontSize: 20, color: CustomColor.whitePrimaryColor))),
      ],
      backgroundColor: CustomColor.scaffoldColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
