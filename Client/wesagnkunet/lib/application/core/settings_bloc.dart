

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/infrastructure/auth/providers.dart';

import '../../infrastructure/auth/repositories.dart';


enum SettingStatus{
  loading,
  none,
  signedout
}

class SettingsState extends Equatable{

  SettingStatus status;

  Client? client;

  bool error;

  SettingsState(this.status, [this.client, this.error = false]);

  @override
  List<Object?> get props => [status];

}


class SettingsEvent extends Equatable{

  @override
  List<Object?> get props => [];

}

class InitEvent extends SettingsEvent{

}

class SignoutEvent extends SettingsEvent{

}


class SettingsBloc extends Bloc<SettingsEvent, SettingsState>{

  AuthRepository cleanRepository = AuthInfrastractureProvider.provideAuthRepository();

  SettingsBloc(): super(SettingsState(SettingStatus.loading)){

    on<InitEvent>(_init);
    on<SignoutEvent>(_signout);

  }

  Future<AuthenticatedAuthRepository> get authenticatedRepository async{
    return await AuthInfrastractureProvider.provideAuthenticatedRepository();
  }

  void _init(InitEvent event, Emitter<SettingsState> emitter) async{

    emitter.call(
      SettingsState(
        SettingStatus.loading
      )
    );

    try{

      Client client = await (await authenticatedRepository).getMyAccount();

      emitter.call(
        SettingsState(
          SettingStatus.none,
          client
        )
      );

    }
    catch (e){
      emitter.call(
        SettingsState(
          SettingStatus.none,
          null,
          true
        )
      );
    }


  }

  void _signout(SignoutEvent event, Emitter<SettingsState> emitter) async{

    await cleanRepository.logout();

    emitter.call(
      SettingsState(
        SettingStatus.signedout
      )
    );

  }

}

