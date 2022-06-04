import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/infrastructure/auth/repositories.dart';

import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';


part 'events.dart';
part 'states.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState>{

  AuthRepository repository;

  LoginBloc(this.repository): super(LoginState()){
    on<SubmitLogin>(_onSubmitLogin);
  }

  void _onSubmitLogin(SubmitLogin event, Emitter<LoginState> emitter) async{
    emitter.call(
      LoginState(
        LoginStatus.loggingIn
      )
    );
    
    try{
      await repository.login(event.username, event.password);
      log("Logging is username: ${event.username}, password: ${event.password}");
      emitter.call(
        LoginState(
          LoginStatus.loggedIn
        )
      );


    } on ApiException catch (e){
      log("Exception caught. Status: ${e.statusCode}, Body:${e.response?.body}");
      log("Setting Status: None");
      emitter.call(
        LoginState(
          LoginStatus.none,
          e
        )
      );
    }

  }


}


