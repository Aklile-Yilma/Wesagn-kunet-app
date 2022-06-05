
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dart:ui';



class CoreBottomNavigation extends StatelessWidget {

  const CoreBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    final double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
    
    return SizedBox(
      width: _deviceWidth,
      height: _deviceHeight * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              context.go("/core/certificates");
            },
            child: Tooltip(
              message: "My Certificates",
              child: Image.asset(
                "assets/images/certificate_icon.jpg",
                height: 50,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                context.go("/core");
              },
              child: Tooltip(
                message: "Home",
                child: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.blue,
                ),
              )),
          TextButton(
              onPressed: () {
                context.go("/core/settings");
              },
              child: Tooltip(
                message: "Settings",
                child: Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.blue,
                ),
              ))
        ],
      ),
    );
  }
}
