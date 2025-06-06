import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/feature/login/bloc/login_bloc.dart';
import 'package:profile_management_app/feature/login/bloc/login_event.dart';
import 'package:profile_management_app/feature/login/bloc/login_state.dart';
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

  clearTextEditingController() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
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
            BlocSelector<LoginBloc, LoginState, bool>(
              selector: (state) {
                return state.showPassword;
              },
              builder: (context, state) {
                return MtextPasswordFormField(
                  onTapSuffixIcon: () {
                    loginBloc.add(LoginPasswordToggled());
                  },
                  controller: passwordController,
                  validator: Validators.loginPasswordValidator,
                  labelText: "Password",
                  hintText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  isShowPassword: state,
                );
              },
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
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    loginBloc.add(
                      LoginBtnPressed(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );

                    clearTextEditingController();
                  }
                },
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
                    loginBloc.add(LoginStateReset());
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
