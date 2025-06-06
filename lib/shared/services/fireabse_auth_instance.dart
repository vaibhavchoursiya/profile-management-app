import 'package:firebase_auth/firebase_auth.dart';

class FireabseAuthInstance {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FireabseAuthInstance._();

  static FireabseAuthInstance get firebaseAuthInstance =>
      FireabseAuthInstance._();
}
