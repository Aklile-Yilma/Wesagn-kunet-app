
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dart:ui';



class AdminBottomNavigation extends StatelessWidget {

  int currentIndex;

  List<String> paths = ["/core", "/admin", "/core/settings"];
  List<String> labels = ["Exit", "Home", "Settings"];
  List<Icon> icons = const [Icon(Icons.exit_to_app), Icon(Icons.home), Icon(Icons.settings)];

  AdminBottomNavigation(this.currentIndex, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      List<BottomNavigationBarItem> items = [];
      for(int i=0; i<paths.length; i++){
        items.add(
          BottomNavigationBarItem(
            icon: icons[i],
            tooltip: labels[i],
            label: labels[i]
          )
        );
      }

    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          context.go(paths[index]);
        },
        items: items
    );
    
  }
}
