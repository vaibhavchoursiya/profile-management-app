import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_event.dart';
import 'package:profile_management_app/feature/register/bloc/register_state.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  static RegisterState get initialState => RegisterState(
    stateStatusModel: StateStatusModel(
      status: Status.initial,
      message: "initial",
    ),
    showPassword: false,
    accepted: false,
  );

  final AuthRepositoryBase authRepositoryBase;

  RegisterBloc({required this.authRepositoryBase}) : super(initialState) {
    on<RegisterBtnPressed>(_registerBtnPressed);
    on<RegisterPasswordToggled>(_registerPasswordToggled);
    on<RegisterCheckBoxClicked>(_registerCheckBoxClicked);
    on<RegisterStateReset>(_registerStateReset);
  }

  _registerBtnPressed(RegisterBtnPressed event, emit) async {
    try {
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.loading,
            message: "Loading",
          ),
        ),
      );

      final AuthModel authModel = AuthModel(
        userName: event.username,
        email: event.email,
        password: event.password,
      );

      await authRepositoryBase.registerUser(authModel);

      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.success,
            message: "Registration SuccessFul",
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.failed,
            message: "$e",
          ),
        ),
      );
    } catch (e) {
      debugPrint("RegisterBloc: $e");
      emit(initialState);
    }
  }

  _registerCheckBoxClicked(RegisterCheckBoxClicked event, emit) {
    emit(state.copyWith(accepted: event.accepted));
  }

  _registerPasswordToggled(event, emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  _registerStateReset(event, emit) {
    emit(initialState);
  }
}
