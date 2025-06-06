import 'package:user_api/src/models/user_model.dart';

abstract class UserApiBase {
  Future<void> saveUserDetails(UserModel userModel);

  Future<void> updateUserDetails(UserModel userModel);

  Stream<List<UserModel>> getAllUserDeatils();

  Future<void> deleteUserDetails(String id);
}
