import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/bottom_nav.dart';
import '../components/certificate_delete_update.dart';

class DeathCertificateDetail extends StatelessWidget {
  const DeathCertificateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text("Death Certificate Detail"),
        centerTitle: true,
      ),
      body: CertificateDeleteUpdateWidget(
    
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/"),
        child: Text("Home"),
      ),
      bottomNavigationBar: CustomeBottomNav(),
    );
  }
}
