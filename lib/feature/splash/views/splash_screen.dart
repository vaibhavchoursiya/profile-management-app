import 'package:flutter/material.dart';
import 'package:profile_management_app/feature/home/views/home_screen.dart';
import 'package:profile_management_app/feature/login/views/login_screen.dart';
import 'package:profile_management_app/shared/services/fireabse_auth_instance.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FireabseAuthInstance.firebaseAuthInstance.firebaseAuth
              .authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
