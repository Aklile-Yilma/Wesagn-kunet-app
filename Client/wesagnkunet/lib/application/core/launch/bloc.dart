import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/infrastructure/auth/AccountManager.dart';

part 'states.dart';
part 'events.dart';


class LaunchBloc extends Bloc<LaunchEvent, LaunchState>{

  LaunchBloc(): super(LaunchState()){
    on<LaunchEvent>(_launch);
  }


  void _launch(LaunchEvent event, Emitter<LaunchState> emitter) async{

    String? token = await AccountManager.getToken();


    if(token == null){
      emitter.call(
        LaunchState(
          AuthenticationStatus.unauthenticated
        )
      );
    }

    else{
      emitter.call(
        LaunchState(
          AuthenticationStatus.authenticated
        )
      );
    }
    

  }



}