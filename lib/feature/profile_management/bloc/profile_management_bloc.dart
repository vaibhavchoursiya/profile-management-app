import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_event.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_state.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

class ProfileManagementBloc
    extends Bloc<ProfileManagementEvent, ProfileManagementState> {
  static ProfileManagementState get initialState => ProfileManagementState(
    stateStatusModel: StateStatusModel(status: Status.initial, message: ""),
    imagePath: "",
    genderList: ["Male", "Female"],
    selectedGender: "Male",
    selectedDegree: "BTech",
  );

  final UserRepositoryBase userRepositoryBase;
  final FirebaseAuth firebaseAuth;
  ProfileManagementBloc({
    required this.userRepositoryBase,
    required this.firebaseAuth,
  }) : super(initialState) {
    on<ProfileManagementDataLoaded>(_profileManagementDataLoaded);
    on<ProfileManagementImageUploaded>(_profileManagementImageUploaded);
    on<ProfileManagementDegreeSelected>(_profileManagementDegreeSelected);
    on<ProfileManagementGenderSelected>(_profileManagementGenderSelected);
    on<ProfileManagementDataSubmitted>(_profileManagementDataSubmitted);
    on<ProfileManagementStateReset>(_resetState);
  }

  Future _profileManagementDataLoaded(
    ProfileManagementDataLoaded event,
    Emitter<ProfileManagementState> emit,
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

      final UserModel userModel = await userRepositoryBase.getUserDetails(
        firebaseAuth.currentUser!.uid,
      );

      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.loaded,
            message: "Loaded",
          ),
          imagePath: userModel.userImage,
          selectedDegree: userModel.degree,
          selectedGender: userModel.gender,
          userModel: userModel,
        ),
      );
    } catch (e) {
      debugPrint("Loaded: $e");
      emit(initialState);
    }
    // print(userModel.toMap().toString());
  }

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
  ) async {
    try {
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.success,
            message: "Success",
          ),
        ),
      );

      final UserModel userModel = UserModel(
        userImage: event.imagePath,
        // id: "-1",
        name: event.name,
        dateOfBirth: event.dOB,
        address: event.address,
        gender: event.selectedGender,
        degree: event.selectedDegree,
        institutionName: event.institutionName,
        yearOfPassing: int.parse(event.passingYear),
        jobTitle: event.jobTitle,
        companyName: event.companyName,
        experience: double.parse(event.experience),
        createdAt: DateFormat("dd-MM-yyyy").format(DateTime.now()),
        userId: firebaseAuth.currentUser!.uid,
      );

      if (state.userModel == null) {
        await userRepositoryBase.saveUserDetails(userModel);
      } else {
        await userRepositoryBase.updateUserDetails(userModel);
      }

      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.success,
            message: "profile is submitted",
          ),
        ),
      );
    } catch (e) {
      debugPrint("Profile Save: $e");
      emit(
        state.copyWith(
          stateStatusModel: StateStatusModel(
            status: Status.failed,
            message: "$e",
          ),
        ),
      );
    }
  }

  _resetState(event, emit) {
    emit(initialState);
  }
}
