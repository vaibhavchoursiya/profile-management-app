import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  // final String id;
  final String name;
  final String dateOfBirth;
  final String address;
  final String gender;

  final String degree;
  final String institutionName;
  final int yearOfPassing;

  final String jobTitle;
  final String companyName;
  final double experience;

  final String createdAt;

  final String userImage;
  final String userId;

  UserModel({
    required this.userImage,
    // required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
    required this.degree,
    required this.institutionName,
    required this.yearOfPassing,
    required this.jobTitle,
    required this.companyName,
    required this.experience,

    required this.createdAt,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      // id: data["id"],
      name: data["name"],
      dateOfBirth: data["dateOfBirth"],

      address: data["address"],
      gender: data["gender"],
      degree: data["degree"],
      institutionName: data["institutionName"],
      yearOfPassing: data["yearOfPassing"],
      jobTitle: data["jobTitle"],
      companyName: data["companyName"],
      experience: data["experience"],
      createdAt: data["createdAt"],
      userImage: data["userImage"],
      userId: data["userId"],
    );
  }

  toMap() {
    return {
      "name": name,
      "dateOfBirth": dateOfBirth,
      "address": address,
      "gender": gender,
      "degree": degree,
      "institutionName": institutionName,
      "yearOfPassing": yearOfPassing,
      "jobTitle": jobTitle,
      "companyName": companyName,
      "experience": experience,
      "createdAt": createdAt,
      "userImage": userImage,
      "userId": userId,
    };
  }

  @override
  List<Object?> get props => [
    userImage,
    //  id,
    name,
    dateOfBirth,
    address,
    gender,
    degree,
    institutionName,
    yearOfPassing,
    jobTitle,
    companyName,
    experience,

    createdAt,
    userId,
  ];
}
