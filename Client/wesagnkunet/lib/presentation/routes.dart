import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/presentation/Forms/MarriageForm.dart';
import 'package:wesagnkunet/presentation/admin/certificates/birth/birth_certificate_detail.dart';
import 'package:wesagnkunet/presentation/admin/certificates/birth/birth_certificates.dart';
import 'package:wesagnkunet/presentation/admin/certificates/certificate_list_screens.dart';
import 'package:wesagnkunet/presentation/admin/certificates/death/death_certificate_detail.dart';
import 'package:wesagnkunet/presentation/admin/certificates/death/death_certificates.dart';
import 'package:wesagnkunet/presentation/admin/certificates/marriage/marriage_certificates.dart';
import 'package:wesagnkunet/presentation/admin/certificates/marriage/marriage_certiificate_detail.dart';
import 'package:wesagnkunet/presentation/admin/main.dart';
import 'package:wesagnkunet/presentation/auth/Login.dart';
import 'package:wesagnkunet/presentation/auth/SignUpPage.dart';
import 'package:wesagnkunet/presentation/core/AccountSettings.dart';
import 'package:wesagnkunet/presentation/core/CertificateDetailPage.dart';
import 'package:wesagnkunet/presentation/core/CertificatesPage.dart';
import 'package:wesagnkunet/presentation/core/HomePage.dart';
import 'package:wesagnkunet/presentation/core/welcomeScreen.dart';

class WesagnKunetRouter extends GoRouter{

  WesagnKunetRouter(): super(
    routes: <GoRoute>[

      GoRoute(
            path: "/",
            builder: (BuildContext context, GoRouterState state) => WelcomePage()
      ),

      GoRoute(
            path: "/auth",
            redirect: (state) => "/auth/login"
      ),

      GoRoute(
            path: "/auth/login",
            builder: (BuildContext context, GoRouterState state) => LoginPage()
      ),

      GoRoute(
            path: "/auth/signup",
            builder: (BuildContext context, GoRouterState state) => SignUpPage()
      ),

      GoRoute(
            path: "/core",
            builder: (BuildContext context, GoRouterState state) => HomePage()
      ),

      GoRoute(
            path: "/core/certificates/new/marriage",
            builder: (BuildContext context, GoRouterState state) => MarriageForm()
      ),

      GoRoute(
            path: "/core/certificates",
            builder: (BuildContext context, GoRouterState state) => Certificates()
      ),

      GoRoute(
            path: "/core/certificates/marriage",
            builder: (BuildContext context, GoRouterState state) => MarriageCertificateDetailPage(state.extra! as MarriageCertificate)
      ),

      GoRoute(
            path: "/core/settings",
            builder: (BuildContext context, GoRouterState state) => Accounts()
      ),

      GoRoute(
          path: "/admin/dashboard",
          builder: (BuildContext context, GoRouterState state) =>
              AdminMainScreen()),
      GoRoute(
        path: "/admin",
        redirect: (state) => "/admin/dashboard",
      ),
      GoRoute(
          path: "/admin/certificates",
          builder: (BuildContext context, GoRouterState state) =>
              CertificateListScreen()),
      GoRoute(
          path: "/admin/marriage/certificates",
          builder: (BuildContext context, GoRouterState state) =>
              MarriageCertificates()),
      GoRoute(
          path: "/admin/marriage/certificates/detaile",
          builder: (BuildContext context, GoRouterState state) =>
              MarriageCertificateDetail()),
      GoRoute(
          path: "/admin/birth/certificates",
          builder: (BuildContext context, GoRouterState state) =>
              BirthCertificates()),
      GoRoute(
          path: "/admin/birth/certificate/detaile",
          builder: (BuildContext context, GoRouterState state) =>
              BirthCertificateDetail()),
      GoRoute(
          path: "/admin/death/certificates",
          builder: (BuildContext context, GoRouterState state) =>
              DeathCertificates()),
      GoRoute(
          path: "/admin/death/certificate/detaile",
          builder: (BuildContext context, GoRouterState state) =>
              DeathCertificateDetail()),
    ],
  );

}
