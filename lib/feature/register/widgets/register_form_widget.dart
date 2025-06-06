import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/shared/validators/validators.dart';
import 'package:profile_management_app/shared/widgets/mtext_form_field.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppTypography.bodyPaddingVertical,
          horizontal: AppTypography.bodyPaddingHorizontal,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppTypography.heightBetweenHeaderAndForm),

            MtextFormField(
              controller: nameController,
              validator: Validators.notEmptyValidator,
              labelText: "Username",
              hintText: "Your username",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),
            MtextFormField(
              controller: emailController,
              validator: Validators.emailValidator,
              labelText: "Email",
              hintText: "Your email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),
            MtextPasswordFormField(
              controller: passwordController,
              validator: Validators.passwordValidator,
              labelText: "Password",
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              isShowPassword: false,
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),
            MtextPasswordFormField(
              controller: passwordController,
              validator: Validators.passwordValidator,
              labelText: "Confirm Password",
              hintText: "Confirm Password",
              textInputType: TextInputType.visiblePassword,
              isShowPassword: false,
            ),

            SizedBox(height: 8.0),

            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const SizedBox(width: 8.0),
                Text(
                  "I accept the terms and privacy policy",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),

            SizedBox(
              width: double.infinity,
              height: AppTypography.btnHeight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: AppTypography.textFormFieldSpace,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
