import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final Color primary = Color(0xFF462fbc);
  // static final Color primary = Colors.indigoAccent;
  static final Color onPrimary = Color(0xFFf7fffd);
  static final Color secondary = Color(0xFFf1b002);
  static final Color onSecondary = Color(0xFFf4fff6);
  static final Color surface = Color(0xFFf6f4ff);
  static final Color onSurface = Color.fromARGB(255, 27, 27, 29);
  static final Color error = Colors.redAccent;
  static final Color onError = Colors.white;

  static final Color ternaryColor = Color(0xFF6c9674);

  static final Color greyishColor = Color(0xFF8e8e8e);

  // static final scaffoldColor = Color.fromARGB(255, 236, 231, 255);
  static final scaffoldColor = Colors.white;
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldColor,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColors.onPrimary),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.roboto(
        fontSize: 16.0,
        color: AppColors.onSurface.withValues(alpha: 0.4),
      ),

      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.onSurface.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.onSurface.withValues(alpha: 0.35),
        ),

        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );
}
