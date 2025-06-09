import 'package:equatable/equatable.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:user_api/user_api.dart';

final class HomeState extends Equatable {
  final StateStatusModel stateStatusModel;
  final List<UserModel> users;
  const HomeState({required this.users, required this.stateStatusModel});

  HomeState copyWith({
    StateStatusModel? stateStatusModel,
    List<UserModel>? users,
  }) {
    return HomeState(
      users: users ?? this.users,
      stateStatusModel: stateStatusModel ?? this.stateStatusModel,
    );
  }

  @override
  List<Object> get props => [stateStatusModel, users];
}
