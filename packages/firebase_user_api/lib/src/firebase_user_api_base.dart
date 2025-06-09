import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:user_api/src/models/user_model.dart';
import 'package:user_api/user_api.dart';

class FirebaseUserApiBase extends UserApiBase {
  final Dio dio = Dio();
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection("users");

  @override
  Future<void> deleteUserDetails(String id) async {
    try {
      await collectionReference.doc(id).delete();
    } catch (e) {
      throw Exception("Failed to delete user: $e");
    }
  }

  @override
  Stream<List<UserModel>> getAllUserDeatils() {
    return FirebaseFirestore.instance
        .collection('users')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) {
                final data = doc.data();
                return UserModel.fromJson(data);
              }).toList(),
        );
  }

  @override
  Future<UserModel> getUserDetails(String userId) async {
    try {
      final querySnapshot =
          await collectionReference.where("userId", isEqualTo: userId).get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception("User not found");
      }

      final doc = querySnapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>?;

      if (data == null) {
        throw Exception("User data is null");
      }

      return UserModel.fromJson(data);
    } catch (e) {
      throw Exception("Failed to get user details: $e");
    }
  }

  @override
  Future<void> saveUserDetails(UserModel userModel) async {
    try {
      final Map<String, dynamic> data = userModel.toMap();
      data["userImage"] = await uploadImage(userModel.userImage);
      await collectionReference.add(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      final Map<String, dynamic> data = userModel.toMap();
      data["userImage"] = await uploadImage(userModel.userImage);
      print(data["userImage"]);

      final querySnapshot =
          await collectionReference
              .where("userId", isEqualTo: userModel.userId)
              .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception("User not found");
      }

      final docId = querySnapshot.docs.first.id;

      await collectionReference.doc(docId).update(data);
    } catch (e) {
      throw Exception("Failed to update user: $e");
    }
  }

  // Future<String?> uploadImageToFirebase(String image) async {
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref();
  //     final imageRef = storageRef.child(
  //       'user_images/${DateTime.now().millisecondsSinceEpoch}.jpg',
  //     );

  //     await imageRef.putData(await File(image).readAsBytes());

  //     final downloadUrl = await imageRef.getDownloadURL();
  //     return downloadUrl;
  //   } catch (e) {
  //     print("Upload error: $e");
  //     return null;
  //   }
  // }

  @override
  Future<List<UserModel>> searchUserByName(String name) async {
    try {
      final QuerySnapshot querySnapshot =
          await collectionReference.where("name", isEqualTo: name).get();

      final List<UserModel> userModels =
          querySnapshot.docs.map((doc) {
            final UserModel userModel = UserModel.fromJson(
              doc.data() as Map<String, dynamic>,
            );
            return userModel;
          }).toList();

      return userModels;
    } catch (e) {
      throw Exception("Not Able to Search : $e");
    }
  }

  // Yes i know that I should store key in .env but its public key already.
  Future<String> uploadImage(String imagePath) async {
    try {
      final Map<String, dynamic> data = {
        "key": "6d207e02198a847aa98d0a2a901485a5",
        "action": "upload",
        "source": await MultipartFile.fromFile(imagePath),
      };
      final FormData formData = FormData.fromMap(data);

      final Response res = await dio.post(
        "https://freeimage.host/api/1/upload",
        data: formData,
      );

      final decodedData = res.data;

      print("Decoded Data: $decodedData");

      if (decodedData["status_code"] == 200) {
        return decodedData["image"]["url"];
      }
      return "";
    } catch (e) {
      print(" error : $e");
      return "";
    }
  }
}
