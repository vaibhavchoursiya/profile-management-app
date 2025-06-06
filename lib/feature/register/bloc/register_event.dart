sealed class RegisterEvent {}

final class RegisterBtnPressed extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  RegisterBtnPressed({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class RegisterStateReset extends RegisterEvent {}
