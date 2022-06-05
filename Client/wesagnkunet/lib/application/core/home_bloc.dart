


import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/infrastructure/auth/providers.dart';
import 'package:wesagnkunet/infrastructure/auth/repositories.dart';
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

  HomeState([
    this.status = HomeStatus.loading,
    this.client
  ]);

  @override
  List<Object?> get props => [status];

}


class HomeBloc extends Bloc<HomeEvent, HomeState>{

  HomeBloc(): super(HomeState()){
    on<HomeInit>(_initialize);
  }

  Future<AuthenticatedAuthRepository> get repository async{
    return await AuthInfrastractureProvider.provideAuthenticatedRepository();
  }

  void _initialize(HomeEvent event, Emitter<HomeState> emitter) async{

    emitter.call(
      HomeState(HomeStatus.loading)
    );

    try{

      Client client = await (await repository).getMyAccount();
      log("Fetched Client. Setting loaded");
      emitter.call(
        HomeState(
          HomeStatus.loaded,
          client
        )
      );

    } on ApiException catch(e){
      log("Error Fetching My Account");
    }

  }

}