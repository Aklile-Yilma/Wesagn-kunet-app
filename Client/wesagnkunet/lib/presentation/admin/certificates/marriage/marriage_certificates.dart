import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/bottom_nav.dart';
import '../components/list_of_particular_certificates.dart';

class MarriageCertificates extends StatelessWidget {
  const MarriageCertificates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: const Text("Marriage Certificates"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, int index) {
          return ListOfParticularCertificate(
            particularcertificates: "Marriage Certificate 1",
          );
        },
      ),
      bottomNavigationBar: CustomeBottomNav(),
    );
  }
}
