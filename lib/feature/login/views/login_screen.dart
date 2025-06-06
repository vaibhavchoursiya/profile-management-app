import 'package:flutter/material.dart';
import 'package:profile_management_app/feature/login/widgets/login_form_widget.dart';
import 'package:profile_management_app/feature/login/widgets/login_header_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: HelperMethods.getResponsiveHeight(context) * 0.08),
            LoginHeaderWidget(),
            LoginFormWidget(),

            // FooterWaveWidget(),
          ],
        ),
      ),
    );
  }
}
