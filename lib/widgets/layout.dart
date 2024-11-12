import 'package:flutter/material.dart';
import 'package:loapetition/constants/nav_items.dart';
import 'package:loapetition/widgets/appbar.dart';
// import 'package:loapetition/widgets/footer.dart';
import 'package:loapetition/widgets/sidebar.dart';

class CustomLayout extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  const CustomLayout({super.key, this.child});

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.popAndPushNamed(
        context, '/${navItems[index]}'); // Adjusted route names
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawSidebar(
          selectedIndex: _selectedIndex,
          onItemSelected: _onItemTapped,
        ),
        appBar: const CustomAppBar(),
        //bottomSheet: const Footer(),
        //bottomNavigationBar: const Footer(),
        body: widget.child);
  }
}
