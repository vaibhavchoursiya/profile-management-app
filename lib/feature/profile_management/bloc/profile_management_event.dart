sealed class ProfileManagementEvent {}

final class ProfileManagementDataLoaded extends ProfileManagementEvent {}

final class ProfileManagementImageUploaded extends ProfileManagementEvent {
  final String imagePath;

  ProfileManagementImageUploaded({required this.imagePath});
}

final class ProfileManagementDegreeSelected extends ProfileManagementEvent {
  final String selectedDegree;

  ProfileManagementDegreeSelected({required this.selectedDegree});
}

final class ProfileManagementGenderSelected extends ProfileManagementEvent {
  final String selectedGender;

  ProfileManagementGenderSelected({required this.selectedGender});
}

final class ProfileManagementDataSubmitted extends ProfileManagementEvent {
  final String imagePath;
  final String name;
  final String dOB;
  final String address;
  final String passingYear;
  final String jobTitle;
  final String companyName;
  final String experience;
  final String selectedDegree;
  final String selectedGender;

  ProfileManagementDataSubmitted({
    required this.imagePath,
    required this.name,
    required this.dOB,
    required this.address,
    required this.passingYear,
    required this.jobTitle,
    required this.companyName,
    required this.experience,
    required this.selectedDegree,
    required this.selectedGender,
  });
}
