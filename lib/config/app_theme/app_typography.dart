import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static const double textFormFieldSpace = 16.0;
  static const double bodyPaddingHorizontal = 24.0;
  static const double bodyPaddingVertical = 8.0;
  static const double heightBetweenHeaderAndForm = 50.0;

  static const double btnHeight = 52.0;

  static TextStyle authHeaderTextStyle(context) => GoogleFonts.roboto(
    color: Theme.of(context).colorScheme.onSurface,
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );
}
