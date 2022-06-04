

class User{

  int id;
  String email;
  String username;
  String? password; //Only for signing up
  bool isAdmin;

  User(this.id, this.username, this.email, this.isAdmin, {this.password});

}