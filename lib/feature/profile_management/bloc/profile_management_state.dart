import 'package:equatable/equatable.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:user_api/user_api.dart';

final class ProfileManagementState extends Equatable {
  final StateStatusModel stateStatusModel;
  final String imagePath;
  final List<String> genderList;
  final String selectedGender;
  final String selectedDegree;
  final UserModel? userModel;

  const ProfileManagementState({
    required this.stateStatusModel,
    required this.imagePath,
    required this.genderList,
    required this.selectedGender,
    required this.selectedDegree,
    this.userModel,
  });

  ProfileManagementState copyWith({
    StateStatusModel? stateStatusModel,
    String? imagePath,
    List<String>? genderList,
    String? selectedGender,
    String? selectedDegree,
    UserModel? userModel,
  }) {
    return ProfileManagementState(
      stateStatusModel: stateStatusModel ?? this.stateStatusModel,
      imagePath: imagePath ?? this.imagePath,
      genderList: genderList ?? this.genderList,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedDegree: selectedDegree ?? this.selectedDegree,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
    stateStatusModel,
    imagePath,
    genderList,
    selectedGender,
    selectedDegree,
    userModel,
  ];
}
