import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/feature/home/bloc/home_event.dart';
import 'package:profile_management_app/feature/home/bloc/home_state.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeState get initialState => HomeState(
    stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
    users: [],
  );

  final UserRepositoryBase userRepositoryBase;
  StreamSubscription<List<UserModel>>? _userStreamSubscription;

  HomeBloc({required this.userRepositoryBase}) : super(initialState) {
    on<HomeDataLoaded>(_homeDataLoaded);
    on<HomeStateReset>(_homeStateReset);
    on<UserListUpdated>(_onUserListUpdated);
  }

  FutureOr<void> _homeDataLoaded(
    HomeDataLoaded event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        stateStatusModel: StateStatusModel(
          status: Status.loading,
          message: "Loading",
        ),
      ),
    );

    await _userStreamSubscription?.cancel(); // Cancel if already subscribed

    _userStreamSubscription = userRepositoryBase.getAllUserDetails().listen((
      userList,
    ) {
      add(UserListUpdated(userList)); // 👈 Trigger internal event
    });
  }

  void _onUserListUpdated(UserListUpdated event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        users: event.users,
        stateStatusModel: StateStatusModel(
          status: Status.success,
          message: "Success",
        ),
      ),
    );
  }

  FutureOr<void> _homeStateReset(
    HomeStateReset event,
    Emitter<HomeState> emit,
  ) async {
    await _userStreamSubscription?.cancel();
    emit(initialState);
  }

  @override
  Future<void> close() {
    _userStreamSubscription?.cancel();
    return super.close();
  }
}
