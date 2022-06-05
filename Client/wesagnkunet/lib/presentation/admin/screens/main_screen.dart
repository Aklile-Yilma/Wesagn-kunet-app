import 'package:flutter/material.dart';
import 'header.dart';
import 'sidemenu.dart';

class AdminMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wesagn Kunet Admin Panel"),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Header(),
        SizedBox(height: 20),
        SideMenu(),
      ]),
    );
  }
}
