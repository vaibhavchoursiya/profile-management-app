import 'package:flutter/material.dart';
import 'package:profile_management_app/feature/register/widgets/register_form_widget.dart';
import 'package:profile_management_app/feature/register/widgets/register_header_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

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
