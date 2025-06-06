import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/validators/validators.dart';
import 'package:profile_management_app/shared/widgets/mtext_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: HelperMethods.getResponsiveHeight(context) * 0.08),
            RegisterHeaderWidget(),
            RegisterFormWidget(),
          ],
        ),
      ),
    );
  }
}

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12.0),
          Text(
            "Create account",
            style: GoogleFonts.roboto(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}

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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 50.0),

            MtextFormField(
              controller: nameController,
              validator: Validators.notEmptyValidator,
              labelText: "Username",
              hintText: "Your username",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            MtextFormField(
              controller: emailController,
              validator: Validators.emailValidator,
              labelText: "Email",
              hintText: "Your email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            MtextPasswordFormField(
              controller: passwordController,
              validator: Validators.passwordValidator,
              labelText: "Password",
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              isShowPassword: false,
            ),
            const SizedBox(height: 16.0),
            MtextPasswordFormField(
              controller: passwordController,
              validator: Validators.passwordValidator,
              labelText: "Confirm Password",
              hintText: "Confirm Password",
              textInputType: TextInputType.visiblePassword,
              isShowPassword: false,
            ),

            const SizedBox(height: 8.0),

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
            const SizedBox(height: 16.0),

            SizedBox(
              width: double.infinity,
              height: 55.0,
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
                    fontSize: 16.0,
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
