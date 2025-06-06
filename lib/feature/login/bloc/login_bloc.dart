import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/feature/login/bloc/login_event.dart';
import 'package:profile_management_app/feature/login/bloc/login_state.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginState get initialState => LoginState(
    stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
    showPassword: false,
  );

  final AuthRepositoryBase authRepositoryBase;
  LoginBloc({required this.authRepositoryBase}) : super(initialState) {
    on<LoginBtnPressed>(_loginBtnPressed);
    on<LoginPasswordToggled>(_loginPasswordToggled);

    on<LogoutPressed>(_logoutPressed);

    on<LoginStateReset>(_loginStateReset);
  }

  _loginBtnPressed(LoginBtnPressed event, emit) async {
    try {
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.loading,
            message: "Loading",
          ),
        ),
      );

      await authRepositoryBase.loginUser(event.email, event.password);

      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.success,
            message: "Login SuccessFul",
          ),
        ),
      );
    } on FirebaseAuthApiException catch (e) {
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.failed,
            message: "$e",
          ),
        ),
      );
    } catch (e) {
      debugPrint("LoginBloc: $e");
      emit(initialState);
    }
  }

  _loginPasswordToggled(event, emit) {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
      ),
    );
  }

  _logoutPressed(event, emit) async {
    await authRepositoryBase.logoutUser();
  }

  _loginStateReset(event, emit) {
    emit(initialState);
  }
}
