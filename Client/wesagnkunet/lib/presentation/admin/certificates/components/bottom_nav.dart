import 'package:flutter/material.dart';

class CustomeBottomNav extends StatelessWidget {
  const CustomeBottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        onTap: (context) {
          print(context);
          int index = context;
          if (index == 0) {}
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), tooltip: "Home", label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              tooltip: "Setting",
              label: "Setting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              tooltip: "Account",
              label: "Account"),
        ]);
  }
}