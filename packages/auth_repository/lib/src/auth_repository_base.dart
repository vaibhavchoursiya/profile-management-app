import 'package:auth_api/auth_api.dart';

class AuthRepositoryBase {
  final AuthApiBase authApiBase;

  AuthRepositoryBase({required this.authApiBase});

  Future<void> registerUser(AuthModel authModel) async {
    await authApiBase.registerUser(authModel);
  }

  Future<void> loginUser(String email, String password) async {
    await authApiBase.loginUser(email, password);
  }

  Future<void> logoutUser() async {
    await authApiBase.logoutUser();
  }
}
