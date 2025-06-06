import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/feature/register/bloc/register_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_event.dart';
import 'package:profile_management_app/feature/register/bloc/register_state.dart';
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

  clearTextEditingController() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = context.read<RegisterBloc>();
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
            BlocSelector<RegisterBloc, RegisterState, bool>(
              selector: (state) {
                return state.showPassword;
              },
              builder: (context, state) {
                return MtextPasswordFormField(
                  onTapSuffixIcon: () {
                    registerBloc.add(RegisterPasswordToggled());
                  },
                  controller: passwordController,
                  validator: Validators.passwordValidator,
                  labelText: "Password",
                  hintText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  isShowPassword: state,
                );
              },
            ),
            SizedBox(height: AppTypography.textFormFieldSpace),
            BlocSelector<RegisterBloc, RegisterState, bool>(
              selector: (state) {
                return state.showPassword;
              },
              builder: (context, state) {
                return MtextPasswordFormField(
                  onTapSuffixIcon: () {
                    registerBloc.add(RegisterPasswordToggled());
                  },
                  controller: confirmPasswordController,
                  passwordController: passwordController,
                  validator: Validators.confirmPasswordValidator,
                  labelText: "Confirm Password",
                  hintText: "Confirm Password",
                  textInputType: TextInputType.visiblePassword,
                  isShowPassword: state,
                );
              },
            ),

            SizedBox(height: 16.0),

            Row(
              children: [
                BlocSelector<RegisterBloc, RegisterState, bool>(
                  selector: (state) {
                    return state.accepted;
                  },
                  builder: (context, state) {
                    return Checkbox(
                      value: state,
                      onChanged: (value) {
                        registerBloc.add(
                          RegisterCheckBoxClicked(accepted: value!),
                        );
                      },
                    );
                  },
                ),
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
                onPressed: () {
                  if (registerFormKey.currentState!.validate()) {
                    if (registerBloc.state.accepted) {
                      registerBloc.add(
                        RegisterBtnPressed(
                          username: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                      clearTextEditingController();
                    }
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
                  "Register",
                  style: AppTypography.formBtnTextStyle(context),
                ),
              ),
            ),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
