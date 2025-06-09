import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/feature/search/bloc/search_event.dart';
import 'package:profile_management_app/feature/search/bloc/search_state.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:user_repository/user_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static SearchState get initialState => SearchState(
    stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
    userModelList: [],
  );

  final UserRepositoryBase userRepositoryBase;
  SearchBloc({required this.userRepositoryBase}) : super(initialState) {
    on<SearchBtnPressed>(_searchBtnPressed);
    on<SearchResetState>(_searchResetState);
  }

  FutureOr<void> _searchBtnPressed(
    SearchBtnPressed event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.loading,
            message: "Loading",
          ),
        ),
      );

      final res = await userRepositoryBase.searchUserByName(event.search);

      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.success,
            message: "",
          ),
          userModelList: res,
        ),
      );
    } catch (e) {
      debugPrint("SearchBloc : $e");
      emit(initialState);
    }
  }

  FutureOr<void> _searchResetState(
    SearchResetState event,
    Emitter<SearchState> emit,
  ) {
    emit(initialState);
  }
}
