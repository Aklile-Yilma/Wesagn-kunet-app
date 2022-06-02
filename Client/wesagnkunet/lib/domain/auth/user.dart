

class User{

  int id;
  String email;
  String username;
  String? password; //Only for signing up

  User(this.id, this.username, this.email, {this.password});

}