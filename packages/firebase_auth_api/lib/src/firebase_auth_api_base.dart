import 'package:auth_api/auth_api.dart';
import 'package:auth_api/src/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthApiBase extends AuthApiBase {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> deleteUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseAuthApiException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw FirebaseAuthApiException(
          'Wrong password provided for that user.',
        );
      } else {
        throw FirebaseAuthApiException(
          'Wrong password provided for that user.',
        );
      }
    } catch (e) {
      throw AuthApiException("Faild to login user: $e");
    }
  }

  @override
  Future<void> registerUser(AuthModel authModel) async {
    try {
      final Map<String, dynamic> data = authModel.toMap();

      UserCredential? userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: data["email"],
            password: data["password"],
          );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(data["username"]);
        await userCredential.user!.reload();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseAuthApiException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseAuthApiException(
          'The account already exists for that email.',
        );
      } else {
        throw FirebaseAuthApiException("$e");
      }
    } catch (e) {
      throw AuthApiException("Faild to regsister user: $e");
    }
  }

  @override
  Future<void> updateUser(AuthModel authModel) {
    throw Exception("");
  }

  @override
  Future<void> logoutUser() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw AuthApiException("Failed to logout user: $e");
    }
  }
}

class AuthApiException implements Exception {
  final String message;
  AuthApiException(this.message);

  @override
  String toString() => 'AuthApiException: $message';
}

class FirebaseAuthApiException implements Exception {
  final String message;
  FirebaseAuthApiException(this.message);

  @override
  String toString() => message;
}
