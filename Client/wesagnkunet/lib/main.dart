import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/presentation/routes.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final GoRouter _router = WesagnKunetRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: "Wesagn Kunet",
    );
  }
}
