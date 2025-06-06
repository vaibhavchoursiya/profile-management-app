import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/config/app_theme/app_theme.dart';

class MtextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;

  const MtextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    // final border = UnderlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
    //     width: 3.0,
    //   ),
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          validator: (value) => validator(value),
          keyboardType: textInputType,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: hintText,

            hintStyle: GoogleFonts.roboto(
              fontSize: 16.0,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.4),
            ),

            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.35),
              ),

              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ],
    );
  }
}
