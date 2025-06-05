import 'package:flutter/material.dart';
import 'package:profile_management_app/feature/register/widgets/register_background_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/widgets/auth_screen_cliper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RegisterBackgroundWidget(),
          Positioned(
            top: HelperMethods.getResponsiveHeight(context) * 0.06,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: ClipPath(
              clipper: AuthScreenCliper(),
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: RegisterFormWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

    return Form(key: registerFormKey, child: Column(children: []));
  }
}
