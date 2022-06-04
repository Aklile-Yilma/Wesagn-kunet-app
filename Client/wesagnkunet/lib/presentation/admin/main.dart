import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'certificates/certificate_list_screens.dart';
import 'certificates/marriage/marriage_certificates.dart';
import 'certificates/marriage/marriage_certiificate_detail.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  static const String title = "GoRouter :Defining Declarative Routes";

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: title,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            CertificateListScreen(),
      ),
      GoRoute(
        path: '/marriage_certificates',
        builder: (BuildContext context, GoRouterState state) =>
            const MarriageCertificates(),
      ),
      GoRoute(
        path: '/marriage_certificate_detail',
        builder: (BuildContext context, GoRouterState state) =>
            const MarriageCertificateDetail(),
      ),
    ],
    initialLocation: '/',
    debugLogDiagnostics: true,
  );
}
