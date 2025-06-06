import 'package:equatable/equatable.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';

final class RegisterState extends Equatable {
  final StateStatusModel stateStatusModel;
  final bool showPassword;
  final bool accepted;

  const RegisterState({
    required this.stateStatusModel,
    required this.showPassword,
    required this.accepted,
  });

  RegisterState copyWith({
    StateStatusModel? stateStatusModel,
    bool? showPassword,
    bool? accepted,
  }) {
    return RegisterState(
      accepted: accepted ?? this.accepted,
      stateStatusModel: stateStatusModel ?? this.stateStatusModel,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [stateStatusModel, showPassword, accepted];
}
