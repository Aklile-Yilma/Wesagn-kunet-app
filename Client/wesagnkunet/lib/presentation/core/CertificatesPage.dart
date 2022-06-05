import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:go_router/go_router.dart";
import 'package:wesagnkunet/application/core/certificates_bloc.dart';

import 'dart:ui';

import 'package:wesagnkunet/presentation/core/widgets/BottomNavigation.dart';

void main() {
  runApp(MaterialApp(home: Certificates()));
}

enum CertificateType{

  birth, 
  marriage,
  death

}

class CertificateCard extends StatelessWidget{

  CertificateType _type;
  int _certificateId;
  DateTime _date;
  dynamic _certificate;


  CertificateCard(this._type, this._certificateId, this._date, this._certificate);

  @override
  Widget build(BuildContext context) {
    
    String imagePath, label, redirectPath;

    switch(_type){
      
      case CertificateType.birth:
        imagePath = "assets/images/baby.jpg";
        label = "Birth Certifcate";
        redirectPath = "/core/certificates/birth";
        break;
      case CertificateType.marriage:
        imagePath = "assets/images/marriage.webp";
        label = "Marriage Certifcate";
        redirectPath = "/core/certificates/marriage";
        break;
      case CertificateType.death:
        imagePath = "assets/images/death.jpg";
        label = "Death Certifcate";
        redirectPath = "/core/certificates/death";
        break;
    }

    return GestureDetector(
      onTap: () {
        context.go(redirectPath, extra: _certificate);
      },
      child: Card(
        child: Stack(
          children: [
            Image.asset(
              imagePath,
            fit: BoxFit.cover,
          ),

          Align(
            heightFactor: 2.8,
            alignment: Alignment.bottomCenter,
            child: Container(

              decoration: BoxDecoration(
                color: Color.fromARGB(150, 0, 0, 0)
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _date.toString().split(" ")[0],
                    style: TextStyle(
                        color: Colors.white,
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));

  }

}



class Certificates extends StatelessWidget {
  const Certificates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
   
    return Scaffold(
      body: BlocProvider<CertificatesBloc>(
        create: (_) => CertificatesBloc()..add(InitEvent()),
        child: BlocBuilder<CertificatesBloc, CertificatesState>(
          builder: (context, state) {

            if(state.status == CertificatesStatus.loading){
              return CircularProgressIndicator();
            }

            if(state.status == CertificatesStatus.error){
              return const Align(
                alignment: Alignment.center,
                child: Text(
                    "Oops! Looks like there was an error getting your certificates. Check your network and try again.",
                    style: TextStyle(color: Colors.red),
                  ),
              );
            }


            return ListView.builder(
              itemCount: state.marriageCertificates.length,
              itemBuilder: ((context, index) {

                  return CertificateCard(
                    CertificateType.marriage,
                    state.marriageCertificates[index].id,
                    state.marriageCertificates[index].detail.applicationDate,
                    state.marriageCertificates[index]
                  );

              }),
            );
          }
        ),
      ),
      bottomNavigationBar: CoreBottomNavigation(),
    );
  }
}
