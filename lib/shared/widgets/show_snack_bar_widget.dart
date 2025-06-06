import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackBarWidget(BuildContext context, String message, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
  );
}
