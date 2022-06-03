import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/bottom_nav.dart';
import '../components/certificate_delete_update.dart';

class BirthCertificateDetail extends StatelessWidget {
  const BirthCertificateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text("Birth Certificate Detail"),
        centerTitle: true,
      ),
      body: CertificateDeleteUpdateWidget(
        Certificate: "Birth Certificate 1",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/"),
        child: Text("Home"),
      ),
      bottomNavigationBar: CustomeBottomNav(),
    );
  }
}
