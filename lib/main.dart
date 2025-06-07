import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_user_api/firebase_user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/config/app_router/app_routes.dart';
import 'package:profile_management_app/config/app_theme/app_theme.dart';
import 'package:profile_management_app/feature/login/bloc/login_bloc.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_bloc.dart';
import 'package:profile_management_app/feature/splash/cubit/splash_cubit.dart';
import 'package:profile_management_app/firebase_options.dart';
import 'package:profile_management_app/shared/services/fireabse_auth_instance.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseAuth = FireabseAuthInstance.firebaseAuthInstance.firebaseAuth;

  final FirebaseAuthApiBase firebaseAuthApiBase = FirebaseAuthApiBase(
    firebaseAuth: firebaseAuth,
  );

  final FirebaseUserApiBase firebaseUserApiBase = FirebaseUserApiBase();

  runApp(
    MyApp(
      firebaseAuthApiBase: firebaseAuthApiBase,
      firebaseAuth: firebaseAuth,
      firebaseUserApiBase: firebaseUserApiBase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final FirebaseAuthApiBase firebaseAuthApiBase;
  final FirebaseAuth firebaseAuth;
  final FirebaseUserApiBase firebaseUserApiBase;
  const MyApp({
    super.key,
    required this.firebaseAuthApiBase,
    required this.firebaseAuth,
    required this.firebaseUserApiBase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create:
              (context) => AuthRepositoryBase(authApiBase: firebaseAuthApiBase),
        ),
        RepositoryProvider(
          create:
              (context) => UserRepositoryBase(userApiBase: firebaseUserApiBase),
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

          BlocProvider(
            create:
                (context) => ProfileManagementBloc(
                  firebaseAuth: firebaseAuth,
                  userRepositoryBase: context.read<UserRepositoryBase>(),
                ),
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
