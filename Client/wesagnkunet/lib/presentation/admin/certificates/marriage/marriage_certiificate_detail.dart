import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/bottom_nav.dart';
import '../components/certificate_delete_update.dart';

class MarriageCertificateDetail extends StatelessWidget {
  const MarriageCertificateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text("Marriage Certificate Detail"),
        centerTitle: true,
      ),
      body: CertificateDeleteUpdateWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/"),
        child: Text("Home"),
      ),
      bottomNavigationBar: const CustomeBottomNav(),
    );
  }
}
