import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/splash/cubit/splash_cubit.dart';
import 'package:profile_management_app/feature/splash/cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialize();
    });
  }

  initialize() async {
    final SplashCubit splashCubit = context.read<SplashCubit>();
    splashCubit.checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.isUserLogged == true) {
          context.go("/home");
        } else {
          context.go("/login");
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
