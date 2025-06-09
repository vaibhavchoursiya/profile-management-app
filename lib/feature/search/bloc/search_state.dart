import 'package:equatable/equatable.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:user_api/user_api.dart';

final class SearchState extends Equatable {
  final StateStatusModel stateStatusModel;
  final List<UserModel> userModelList;

  const SearchState({
    required this.stateStatusModel,
    required this.userModelList,
  });

  SearchState copyWith({
    StateStatusModel? stateStatusModel,
    List<UserModel>? userModelList,
  }) {
    return SearchState(
      stateStatusModel: stateStatusModel ?? this.stateStatusModel,
      userModelList: userModelList ?? this.userModelList,
    );
  }

  @override
  List<Object> get props => [stateStatusModel, userModelList];
}
