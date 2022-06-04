


part of 'bloc.dart';

class LoginEvent extends Equatable{


  @override
  List<Object?> get props => [];

}


class SubmitLogin extends LoginEvent{

  String username;
  String password;

  SubmitLogin(this.username, this.password);

}

