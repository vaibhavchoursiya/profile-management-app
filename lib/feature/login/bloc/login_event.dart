sealed class LoginEvent {}

final class LoginBtnPressed extends LoginEvent {
  final String email;
  final String password;

  LoginBtnPressed({required this.email, required this.password});
}

final class LoginPasswordToggled extends LoginEvent {}

final class LogoutPressed extends LoginEvent {}

final class LoginStateReset extends LoginEvent {}
