import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/admin/marriage_bloc/bloc/adimmarriagecertificatebloc_bloc.dart';

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
      body: BlocBuilder<AdminMarriageCertificateBloc,
          AdminMarriageCertificateBlocState>(
        builder: (context, state) {
          if (state is FetchingMarriageCertificatesState) {
            return CircularProgressIndicator.adaptive(
              backgroundColor: Colors.blueAccent,
              semanticsLabel: "Loading",
            );
          } else if (state is FetchedMarriageCertificatesState) {
            return ListView.builder(
              itemCount: state.marriageCertificates.length,
              itemBuilder: (context, int index) {
                return ListOfParticularCertificate(
                  marriageCertificate: state.marriageCertificates[index],
                );
              },
            );
          } else if (state is FetchMarriageCertificatesErrorsState) {
            return Center(
              child: Text(
                "Failed to Load certificates",
                style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.red,
                    fontSize: 20),
              ),
            );
          }

          return Text("Unhandled State");
        },
      ),
      bottomNavigationBar: CustomeBottomNav(),
    );
  }
}
