import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/bottom_nav.dart';

class CertificateListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("Certificates"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(5),
          children: [
            CertificatesListView(
              path: "/admin/marriage/certificates",
              image_path: "assets/images/marriage.webp",
              title: "Birth certificates",
            ),
            CertificatesListView(
              path: "/admin/marriage/certificates",
              image_path: "assets/images/marriage.webp",
              title: "Marriage Certificates",
            ),
            CertificatesListView(
              path: "/admin/marriage/certificates",
              image_path: "assets/images/death.jpg",
              title: "Death Certificates",
            ),
            CertificatesListView(
              path: "admin/marriage/certificates",
              image_path: "assets/images/marriage.webp",
              title: "Marriage Certificates",
            ),
          ],
        ),
        bottomNavigationBar: AdminBottomNavigation(1));
  }
}

class CertificatesListView extends StatelessWidget {
  final String path;
  final String image_path;
  final String title;

  CertificatesListView(
      {required this.path, required this.image_path, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go(path),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 10,
          child: Container(
            child: Column(children: [
              Image(
                image: AssetImage(
                  image_path,
                ),
                fit: BoxFit.cover,
              ),
              Text(title),
            ]),
          ),
        ),
      ),
    );
  }
}
