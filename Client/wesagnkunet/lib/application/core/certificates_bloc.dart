

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

enum CertificatesStatus{

  loading,
  loaded,
  error

}


class CertificatesState extends Equatable{

  CertificatesStatus status;
  List<MarriageCertificate> marriageCertificates;

  CertificatesState(this.status, [this.marriageCertificates = const []]);

  @override
  List<Object?> get props => [status, marriageCertificates];

}


class CertificatesEvent extends Equatable{

  @override
  List<Object?> get props => [];

}

class InitEvent extends CertificatesEvent{

}


class CertificatesBloc extends Bloc<CertificatesEvent, CertificatesState>{

  CertificatesBloc(): super(CertificatesState(CertificatesStatus.loading)){

    on<InitEvent>(_init);

  }


  Future<MarriageCertificateRepository> get repository async{
    return await CoreInfrastractureProvider.provideMarriageCertificateRepository();
  }


  void _init(InitEvent event, Emitter<CertificatesState> emitter) async{

    emitter.call(
      CertificatesState(
        CertificatesStatus.loading
      )
    );

    try{

      List<MarriageCertificate> certificates = await (await repository).getAll();
      emitter.call(
        CertificatesState(
          CertificatesStatus.loaded,
          certificates
        ),
      );

    } catch (e){

      log("Error Found ${e.toString()}");
      emitter.call(
        CertificatesState(
          CertificatesStatus.error
        )
      );

    }

  }

}