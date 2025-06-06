class UserModel {
  final String id;
  final String name;
  final DateTime dateOfBirth;
  final String address;
  final String gender;

  final String degree;
  final String institutionName;
  final DateTime yearOfPassing;

  final String jobTitle;
  final String companyName;
  final num experience;

  final DateTime createdAt;

  final String userImage;

  UserModel({
    required this.userImage,
    required this.id,
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
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data["id"],
      name: data["name"],
      dateOfBirth: DateTime.fromMillisecondsSinceEpoch(
        data["dateOfBirth"] * 1000,
      ),
      address: data["address"],
      gender: data["gender"],
      degree: data["degree"],
      institutionName: data["institutionName"],
      yearOfPassing: data["yearOfPassing"],
      jobTitle: data["jobTitle"],
      companyName: data["companyName"],
      experience: data["experience"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["createdAt"] * 1000),
      userImage: data["userImage"],
    );
  }

  toMap() {
    return {
      "id": id,
      "name": name,
      "dateOfBirth": dateOfBirth.millisecondsSinceEpoch / 1000,
      "address": address,
      "gender": gender,
      "degree": degree,
      "institutionName": institutionName,
      "yearOfPassing": yearOfPassing,
      "jobTitle": jobTitle,
      "companyName": companyName,
      "experience": experience,
      "createdAt": createdAt.millisecondsSinceEpoch / 1000,
      "userImage": userImage,
    };
  }
}
