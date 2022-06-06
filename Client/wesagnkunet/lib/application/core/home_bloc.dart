


import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/auth/providers.dart';
import 'package:wesagnkunet/infrastructure/auth/repositories.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';

abstract class HomeEvent extends Equatable{

}


class HomeInit extends HomeEvent{
  @override
  List<Object?> get props => [];
}



enum HomeStatus{
  loading,
  loaded
}

class HomeState extends Equatable{

  HomeStatus status;

  Client? client;
  List<MarriageCertificate>? certificates;

  HomeState([
    this.status = HomeStatus.loading,
    this.client,
    this.certificates
  ]);

  @override
  List<Object?> get props => [status, client, certificates];

}


class HomeBloc extends Bloc<HomeEvent, HomeState>{

  HomeBloc(): super(HomeState()){
    on<HomeInit>(_initialize);
  }

  Future<AuthenticatedAuthRepository> get repository async{
    return await AuthInfrastractureProvider.provideAuthenticatedRepository();
  }

  Future<MarriageCertificateRepository> get certificateRepository async{
    return await CoreInfrastractureProvider.provideMarriageCertificateRepository();
  }

  void _initialize(HomeEvent event, Emitter<HomeState> emitter) async{

    emitter.call(
      HomeState(HomeStatus.loading)
    );

    try{

      Client client = await (await repository).getMyAccount();
      List<MarriageCertificate> certificates = await (await certificateRepository).getAll();
      log("Fetched Client. Setting loaded");
      emitter.call(
        HomeState(
          HomeStatus.loaded,
          client,
          certificates
        )
      );

    } on ApiException catch(e){
      log("Error Fetching My Account");
    }

  }

}