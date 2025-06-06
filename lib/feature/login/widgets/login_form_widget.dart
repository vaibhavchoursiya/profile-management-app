import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/shared/validators/validators.dart';
import 'package:profile_management_app/shared/widgets/mtext_form_field.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppTypography.bodyPaddingVertical,
          horizontal: AppTypography.bodyPaddingHorizontal,
        ),
        child: Column(
          children: [
            // const SizedBox(height: AppTypography.heightBetweenHeaderAndForm),
            const SizedBox(height: 16.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: Text(
                    "Forget password",

                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  ),
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
                  "Login",
                  style: AppTypography.formBtnTextStyle(context),
                ),
              ),
            ),

            const SizedBox(height: 50.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have a account ?",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    context.go("/register");
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: Text(
                    "Register",

                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
