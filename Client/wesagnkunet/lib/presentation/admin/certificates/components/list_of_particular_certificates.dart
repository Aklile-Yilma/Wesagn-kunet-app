import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListOfParticularCertificate extends StatelessWidget {
  ListOfParticularCertificate({required this.particularcertificates});

  String particularcertificates;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[50],
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(children: [
            Text(
              particularcertificates,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                child: Text("Detail Screen"),
                onPressed: (() => context.go("marriage_certificate_detail"))),
          ]),
        ),
      ),
    );
  }
}
