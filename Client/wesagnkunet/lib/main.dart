import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:wesagnkunet/presentation/Forms/MarriageForm.dart';

void main() {
  runApp(MaterialApp(home: MarriageForm()));
=======
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


>>>>>>> 0721a885f2de1530ee9bcf9530fceb98a6bbed45
}
