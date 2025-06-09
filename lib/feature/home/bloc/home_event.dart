import 'package:user_api/user_api.dart';

sealed class HomeEvent {}

final class HomeDataLoaded extends HomeEvent {}

final class HomeStateReset extends HomeEvent {}

class UserListUpdated extends HomeEvent {
  final List<UserModel> users;

  UserListUpdated(this.users);
}
