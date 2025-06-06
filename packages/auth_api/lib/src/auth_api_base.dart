import 'package:auth_api/src/models/auth_model.dart';

abstract class AuthApiBase {
  Future<void> registerUser(AuthModel authModel);
  Future<void> loginUser(String email, String password);

  Future<void> deleteUser(String id);

  Future<void> updateUser(AuthModel authModel);
}
