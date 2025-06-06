class AuthModel {
  String userName;
  String email;
  String password;

  AuthModel({
    required this.userName,
    required this.email,
    required this.password,
  });

  toMap() {
    return {"username": userName, "email": email, "password": password};
  }
}
