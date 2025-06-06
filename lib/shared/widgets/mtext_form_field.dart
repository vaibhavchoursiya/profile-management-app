import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          validator: (value) {
            return validator(value, labelText);
          },
          keyboardType: textInputType,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

class MtextPasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final Function validator;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final bool isShowPassword;

  const MtextPasswordFormField({
    super.key,
    required this.controller,
    this.passwordController,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.textInputType,
    required this.isShowPassword,
  });

  @override
  Widget build(BuildContext context) {
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
          validator: (value) {
            if (passwordController != null) {
              return validator(value, labelText);
            }

            return validator(value, labelText, passwordController!.text);
          },
          keyboardType: textInputType,
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          obscureText: isShowPassword,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon:
                isShowPassword
                    ? Icon(Icons.lock)
                    : Icon(Icons.remove_red_eye_outlined),
          ),
        ),
      ],
    );
  }
}
