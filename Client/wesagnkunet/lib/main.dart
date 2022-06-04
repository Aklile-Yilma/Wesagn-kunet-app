import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/presentation/routes.dart';
import 'package:wesagnkunet/presentation/core/welcomeScreen.dart';

void main() {
  runApp(MainApp());
}


class MainApp extends StatelessWidget{
  MainApp({Key? key}): super(key: key);

  final GoRouter _router = WesagnKunetRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
              routeInformationParser: _router.routeInformationParser,
              routerDelegate: _router.routerDelegate,
              title: "Wesagn Kunet",
            );
  }


=======
import 'package:wesagnkunet/presentation/auth/SignUpPage.dart';

void main() {
  runApp(MaterialApp(home: SignUpPage()));
>>>>>>> 5962724e9da9528cb145708414a2680fb2bcb3fe
}
