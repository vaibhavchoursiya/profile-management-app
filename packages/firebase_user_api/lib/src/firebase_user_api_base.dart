import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:user_api/src/models/user_model.dart';
import 'package:user_api/user_api.dart';

class FirebaseUserApiBase extends UserApiBase {
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
  Future<UserModel> getUserDetails(String id) async {
    try {
      final doc = await collectionReference.doc(id).get();

      if (doc.exists) {
        return UserModel.fromJson(doc.data()! as Map<String, dynamic>);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      throw Exception("Failed to get user details: $e");
    }
  }

  @override
  Future<void> saveUserDetails(UserModel userModel) async {
    try {
      final Map<String, dynamic> data = userModel.toMap();
      data["userImage"] = "";
      await collectionReference.add(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      final Map<String, dynamic> data = userModel.toMap();
      data["userImage"] = "";
      await collectionReference.doc(userModel.id).update(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadImageToFirebase(String image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(
        'user_images/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      await imageRef.putData(await File(image).readAsBytes());

      final downloadUrl = await imageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Upload error: $e");
      return null;
    }
  }
}
