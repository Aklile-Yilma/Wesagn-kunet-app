
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dart:ui';



class CoreBottomNavigation extends StatelessWidget {

  int currentIndex;

  List<String> paths = ["/core/certificates", "/core", "/core/settings"];
  List<String> labels = ["My Certificates", "Home", "Settings"];
  List<Icon> icons = const [Icon(Icons.account_box), Icon(Icons.home), Icon(Icons.settings)];

  CoreBottomNavigation(this.currentIndex, {
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
