import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/config/app_router/app_routes.dart';
import 'package:profile_management_app/config/app_theme/app_theme.dart';
import 'package:profile_management_app/feature/login/bloc/login_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_bloc.dart';
import 'package:profile_management_app/feature/splash/cubit/splash_cubit.dart';
import 'package:profile_management_app/firebase_options.dart';
import 'package:profile_management_app/shared/services/fireabse_auth_instance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseAuth = FireabseAuthInstance.firebaseAuthInstance.firebaseAuth;

  final FirebaseAuthApiBase firebaseAuthApiBase = FirebaseAuthApiBase(
    firebaseAuth: firebaseAuth,
  );

  runApp(
    MyApp(firebaseAuthApiBase: firebaseAuthApiBase, firebaseAuth: firebaseAuth),
  );
}

class MyApp extends StatelessWidget {
  final FirebaseAuthApiBase firebaseAuthApiBase;
  final FirebaseAuth firebaseAuth;
  const MyApp({
    super.key,
    required this.firebaseAuthApiBase,
    required this.firebaseAuth,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create:
              (context) => AuthRepositoryBase(authApiBase: firebaseAuthApiBase),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => RegisterBloc(
                  authRepositoryBase: context.read<AuthRepositoryBase>(),
                ),
          ),
          BlocProvider(
            create:
                (context) => LoginBloc(
                  authRepositoryBase: context.read<AuthRepositoryBase>(),
                ),
          ),
          BlocProvider(
            create: (context) => SplashCubit(firebaseAuth: firebaseAuth),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
