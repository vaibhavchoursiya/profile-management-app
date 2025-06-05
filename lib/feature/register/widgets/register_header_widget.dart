import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(Icons.arrow_back),
          ),

          const SizedBox(width: 12.0),
          Text(
            "Create Account",
            style: GoogleFonts.roboto(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
