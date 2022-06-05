

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/user.dart';
import 'package:wesagnkunet/infrastructure/auth/repositories.dart';
import 'package:wesagnkunet/infrastructure/lib/network/AplClient.dart';


enum SignupStatus{
  none,
  loading,
  done
}

class SignupState extends Equatable{

  SignupStatus status;
  bool error;

  SignupState([
    this.status = SignupStatus.none,
    this.error = false
  ]);

  @override
  // TODO: implement props
  List<Object?> get props => [status, error];

}


abstract class SignupEvent extends Equatable{
}

class SubmitSignupForm extends SignupEvent{

  String firstName, middleName, lastName, email, sex, bloddType, city, country, phoneNumber, password;
  DateTime dateOfBirth;
  SubmitSignupForm(
    this.firstName, this.middleName, this.lastName, this.email, 
    this.sex, this.bloddType, this.dateOfBirth, this.city, this.country,
    this.phoneNumber, this.password
  );

  @override
  // TODO: implement props
  List<Object?> get props => [];

}



class SignupBloc extends Bloc<SignupEvent, SignupState>{

  AuthRepository authRepository;

  SignupBloc(this.authRepository): super(SignupState()){
    on<SubmitSignupForm>(_submitForm);
  }


  void _submitForm(SubmitSignupForm event, Emitter<SignupState> emitter) async{
    
    emitter.call(
      SignupState(
        SignupStatus.loading
      )
    );

    try{
      Client client = await authRepository.signup(
        Client(
          -1,
          User(
            -1,
            event.email,
            event.email,
            false,
            password: event.password
          ),
          event.firstName,
          event.middleName,
          event.lastName,
          event.sex,
          event.dateOfBirth,
          event.bloddType,
          event.city,
          event.country,
          event.country,
          event.phoneNumber
        )
      );
      emitter.call(
        SignupState(
          SignupStatus.done
        )
      );
    } 
    catch(e){
      
      log("Error: ${(e as ApiException).response?.body}");

      emitter.call(
        SignupState(
          SignupStatus.none,
          true
        )
      );
    }


  }

}