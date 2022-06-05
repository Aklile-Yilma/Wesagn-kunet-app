part of 'bloc.dart';


enum LoginStatus{
	none,
	loggingIn,
	loggedIn,
}


class LoginState extends Equatable{

	ApiException? apiException;	

	LoginStatus status = LoginStatus.none;

  LoginState([
      this.status = LoginStatus.none, 
      this.apiException
    ]){
    log("Received Status: $status");
    
  }

	@override
	List<Object?> get props => [status, apiException];

}
