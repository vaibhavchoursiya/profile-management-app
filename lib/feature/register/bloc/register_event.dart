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

final class RegisterCheckBoxClicked extends RegisterEvent {
  final bool accepted;

  RegisterCheckBoxClicked({required this.accepted});
}

final class RegisterPasswordToggled extends RegisterEvent {}

final class RegisterStateReset extends RegisterEvent {}
