import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_event.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_state.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';

class ProfileManagementBloc
    extends Bloc<ProfileManagementEvent, ProfileManagementState> {
  static ProfileManagementState get initialState => ProfileManagementState(
    stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
    imagePath: "",
    genderList: ["Male", "Female"],
    selectedGender: "Male",
    selectedDegree: "BTech",
  );

  ProfileManagementBloc() : super(initialState) {
    on<ProfileManagementDataLoaded>(_profileManagementDataLoaded);
    on<ProfileManagementImageUploaded>(_profileManagementImageUploaded);
    on<ProfileManagementDegreeSelected>(_profileManagementDegreeSelected);
    on<ProfileManagementGenderSelected>(_profileManagementGenderSelected);
    on<ProfileManagementDataSubmitted>(_profileManagementDataSubmitted);
  }

  Future _profileManagementDataLoaded(
    ProfileManagementDataLoaded event,
    Emitter<ProfileManagementState> emit,
  ) async {}

  Future _profileManagementImageUploaded(
    ProfileManagementImageUploaded event,
    Emitter<ProfileManagementState> emit,
  ) async {
    emit(
      state.copyWith(
        imagePath: event.imagePath,
        stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
      ),
    );
  }

  Future _profileManagementDegreeSelected(
    ProfileManagementDegreeSelected event,
    Emitter<ProfileManagementState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDegree: event.selectedDegree,
        stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
      ),
    );
  }

  Future _profileManagementGenderSelected(
    ProfileManagementGenderSelected event,
    Emitter<ProfileManagementState> emit,
  ) async {
    print(event.selectedGender);
    emit(
      state.copyWith(
        selectedGender: event.selectedGender,
        stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
      ),
    );
  }

  Future _profileManagementDataSubmitted(
    ProfileManagementDataSubmitted event,
    Emitter<ProfileManagementState> emit,
  ) async {}
}
