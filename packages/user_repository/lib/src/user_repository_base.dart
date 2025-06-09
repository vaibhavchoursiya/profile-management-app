import 'package:user_api/user_api.dart';

class UserRepositoryBase {
  final UserApiBase userApiBase;

  UserRepositoryBase({required this.userApiBase});

  Future<void> saveUserDetails(UserModel userModel) async {
    await userApiBase.saveUserDetails(userModel);
  }

  Future<UserModel> getUserDetails(String userId) async {
    final UserModel userModel = await userApiBase.getUserDetails(userId);

    return userModel;
  }

  Future<void> updateUserDetails(UserModel userModel) async {
    await userApiBase.updateUserDetails(userModel);
  }

  Stream<List<UserModel>> getAllUserDetails() {
    return userApiBase.getAllUserDeatils();
  }
}
