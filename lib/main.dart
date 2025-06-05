import 'package:flutter/material.dart';
import 'package:profile_management_app/config/app_router/app_routes.dart';
import 'package:profile_management_app/config/app_theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      theme: AppTheme.lightTheme,
    );
  }
}
