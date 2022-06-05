


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/presentation/core/CertificatesPage.dart';
import 'package:wesagnkunet/presentation/core/widgets/BottomNavigation.dart';



class SpouseTile extends StatelessWidget{

  Spouse spouse;
  String title;

  SpouseTile(this.spouse, this.title, {Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      title: Text(title),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      children: [

            const SizedBox(height: 20),
            Text(" First Name: ${spouse.firstName}"),
            const SizedBox(height: 20),
            Text(" Middle Name: ${spouse.middleName}"),
            const SizedBox(height: 20),
            Text(" Last Name: ${spouse.lastName}"),
            const SizedBox(height: 20),
      ]
    );
  }

}



class MarriageCertificateDetailPage extends StatelessWidget{

  final MarriageCertificate _certificate;

  MarriageCertificateDetailPage(this._certificate, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            SizedBox(
              child: Image.asset("assets/images/marriage.webp"),
              width: double.infinity
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Marriage Certificate",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    _certificate.detail.issueDate.toString().split(" ")[0],
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SpouseTile(_certificate.wife, "Wife"),
                  const SizedBox(height: 50),
                  SpouseTile(_certificate.husband, "Husband"),
                ],
              ),
            )
      
            
          ]
      
        ),
      ),

      bottomNavigationBar: const CoreBottomNavigation(),

    );

  }


}