import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/config/app_router/app_routes.dart';
import 'package:profile_management_app/config/app_theme/app_theme.dart';
import 'package:profile_management_app/feature/login/bloc/login_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_bloc.dart';
import 'package:profile_management_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final FirebaseAuthApiBase firebaseAuthApiBase = FirebaseAuthApiBase();

  runApp(MyApp(firebaseAuthApiBase: firebaseAuthApiBase));
}

class MyApp extends StatelessWidget {
  final FirebaseAuthApiBase firebaseAuthApiBase;
  const MyApp({super.key, required this.firebaseAuthApiBase});

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
