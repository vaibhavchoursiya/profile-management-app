import 'package:equatable/equatable.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';

final class LoginState extends Equatable {
  final StateStatusModel stateStatusModel;
  final bool showPassword;
  const LoginState({
    required this.stateStatusModel,
    required this.showPassword,
  });

  LoginState copyWith({
    StateStatusModel? stateStatusModel,
    bool? showPassword,
  }) {
    return LoginState(
      stateStatusModel: stateStatusModel ?? this.stateStatusModel,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object> get props => [stateStatusModel, showPassword];
}
