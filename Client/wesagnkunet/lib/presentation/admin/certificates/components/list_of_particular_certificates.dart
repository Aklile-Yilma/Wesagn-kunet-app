import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';

class ListOfParticularCertificate extends StatelessWidget {
  ListOfParticularCertificate({required this.marriageCertificate});

  MarriageCertificate marriageCertificate;

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
              marriageCertificate.husband.firstName,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(marriageCertificate.wife.firstName,
                style: TextStyle(
                  color: Colors.black,
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text("Detail Screen"),
                onPressed: (() => context.go(
                    "admin/marriage/certificates/${marriageCertificate.id}"))),
          ]),
        ),
      ),
    );
  }
}
