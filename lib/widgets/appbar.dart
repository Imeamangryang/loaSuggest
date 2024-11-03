import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapetition/constants/colors.dart';

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
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            child: Text('WLOA',
                style: GoogleFonts.andika(fontSize: 20, color: CustomColor.whitePrimaryColor))),
      ],
      backgroundColor: CustomColor.scaffoldColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
