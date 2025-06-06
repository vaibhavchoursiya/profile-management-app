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
  );

  RegisterBloc() : super(initialState) {
    on<RegisterBtnPressed>(_registerBtnPressed);
    on<RegisterStateReset>(_registerStateReset);
  }

  _registerBtnPressed(RegisterBtnPressed event, emit) {}

  _registerStateReset(event, emit) {
    emit(initialState);
  }
}
