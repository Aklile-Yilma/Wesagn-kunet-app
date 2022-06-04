part of 'bloc.dart';


enum LoginStatus{
	none,
	loggingIn,
	loggedIn,
}


class LoginState extends Equatable{

	ApiException? apiException;	

	LoginStatus status = LoginStatus.none;

  LoginState({status, this.apiException}){
    if(status != null){
      status = status;
    }
  }

	@override
	List<Object?> get props => [status, apiException];

}
