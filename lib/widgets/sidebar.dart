import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loapetition/constants/colors.dart';
import 'package:loapetition/constants/nav_items.dart';

class DrawSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const DrawSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColor.bgLight2Color)),
              color: CustomColor.bgLight2Color,
            ),
            child: Text(
              'Wanted LOA',
              style: GoogleFonts.abrilFatface(
                fontSize: 24,
                color: CustomColor.whitePrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          for (int i = 0; i < navItems.length; i++) // Loop through navItems
            ListTile(
              title: Text(navItems[i]), // Use navItems[i] for title
              selected: selectedIndex == i,
              onTap: () => onItemSelected(i), // Pass index to onItemSelected
            ),
        ],
      ),
    );
  }
}
