import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/admin/birth/bloc/adminbirthcertificatebloc_bloc.dart';
import 'package:wesagnkunet/application/admin/death/bloc/admindeathcertificatebloc_bloc.dart';
import 'package:wesagnkunet/application/admin/marriage_bloc/bloc/adimmarriagecertificatebloc_bloc.dart';
import 'package:wesagnkunet/presentation/admin/certificates/certificate_list_screens.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(AdminMainScreen());
}

class AdminMainScreen extends StatelessWidget {
  AdminMainScreen({Key? key}) : super(key: key);

  static const String title = "GoRouter :Defining Declarative Routes";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdminMarriageCertificateBloc>(
            create: ((BuildContext context) => AdminMarriageCertificateBloc())),
        // BlocProvider<AdminBirthCertificateBlocBloc>(
        //     create: ((BuildContext context) =>
        //         AdminBirthCertificateBlocBloc(repository))),
        // BlocProvider<AdminDeathCertificateBloc>(
        //     create: ((BuildContext context) =>
        //         AdminDeathCertificateBloc(repository))),
      ],
      child: MaterialApp(
        title: "Wesagn Kunet App",
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: AdminMainPage(),
      ),
    );
  }
}

// final GoRouter _router = GoRouter(
//   routes: <GoRoute>[
//     GoRoute(
//       path: '/admin',
//       builder: (BuildContext context, GoRouterState state) => AdminMainScreen(),
//     ),
//     GoRoute(
//       path: '/admin/certificates',
//       builder: (BuildContext context, GoRouterState state) =>
//           CertificateListScreen(),
//     ),
//   ],
//   initialLocation: '/',
//   debugLogDiagnostics: true,
// );
