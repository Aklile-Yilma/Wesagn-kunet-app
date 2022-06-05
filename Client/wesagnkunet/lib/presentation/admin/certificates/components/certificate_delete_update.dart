import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/admin/marriage_bloc/bloc/adimmarriagecertificatebloc_bloc.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';

class CertificateDeleteUpdateWidget extends StatelessWidget {
 

  MarriageCertificate marriageCertificate;
 

  CertificateDeleteUpdateWidget(this.marriageCertificate);

  static const TextStyle CustomeTestStyel = TextStyle(
    color: Colors.black87,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminMarriageCertificateBloc>(
      create: (context) => AdminMarriageCertificateBloc(),
      child: BlocBuilder<AdminMarriageCertificateBloc,
          AdminMarriageCertificateBlocState>(
        builder: (context, state) {
          if (state is GettingMarriageCertificateState) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is LoadedMarriageCertificateState) {
            marriageCertificate = state.marriageCertificate;
          }

          if (state is ApprovedMarriageCertificteState) {
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                        "Approved",
                        style: TextStyle(
                          color: Colors.green
                        ),
                      ),
                )
              );

              context.go("/admin/marriage/certificates");

            });
          }
          else if(state is ApprovalError){

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                        "Failed to approve",
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                )
              );

              context.go("/admin/marriage/certificate");
          }

          if (state is DeletedMarriageCertificateState) {
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                        "Deleted",
                        style: TextStyle(
                          color: Colors.green
                        ),
                      ),
                )
              );

              context.go("/admin/marriage/certificates");

            });
          }
          else if(state is DeletionError){

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                        "Failed to delete",
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                )
              );

              context.go("/admin/marriage/certificate");
          }
    
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              width: 500,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 500,
                    height: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Owner : ${marriageCertificate.detail.users}",
                              style: CustomeTestStyel,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Application date :${marriageCertificate.detail.applicationDate}",
                              style: CustomeTestStyel,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Issue Date : ${marriageCertificate.detail.issueDate}",
                              style: CustomeTestStyel,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Status: ${marriageCertificate.verified}",
                                style: CustomeTestStyel),
                          ),
                        ]),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            child: Text("Approve Certificate"),
                            onPressed: () {

                              context.read<AdminMarriageCertificateBloc>().add(ApproveMarriageCertificateEvent(marriageCertificate.id));

                              
                              }
                          ),
                        ),
                      )]
                    ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            child: Text("Delete  Certificate"),
                            onPressed: () {
                              context.read<AdminMarriageCertificateBloc>().add(DeleteMarriageCertificateEvent(marriageCertificate.id));

                              if (state is DeletingMarriageCertificateState) {
                                Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              } else if (state
                                  is DeletedMarriageCertificateState) {
                                context.go("admin/certificates");
                                return;
                              } else if (state is DeletionError) {
                                Center(
                                  child: Text(
                                    "Failed to delete",
                                    style: TextStyle(
                                        color: Colors.red,
                                        backgroundColor: Colors.white),
                                  ),
                                );
                                return;
                              } else {
                                Center(
                                  child: Text(
                                    "Unhandled State",
                                    style: TextStyle(
                                        color: Colors.red,
                                        backgroundColor: Colors.white,
                                        fontSize: 20),
                                  ),
                                );
                              }
                              // TODO delete functionality
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
