

part of 'bloc.dart';


enum AuthenticationStatus{
  unauthenticated,
  authenticated,
  none
}

class LaunchState extends Equatable{

  AuthenticationStatus status;

  LaunchState([this.status=AuthenticationStatus.none]);


  @override
  List<Object?> get props => [status];

}