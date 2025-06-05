import 'package:flutter/material.dart';
import 'package:profile_management_app/feature/register/widgets/register_header_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

class RegisterBackgroundWidget extends StatelessWidget {
  const RegisterBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Column(
          children: <Widget>[
            SizedBox(height: HelperMethods.getResponsiveHeight(context) * 0.05),

            RegisterHeaderWidget(),
          ],
        ),
      ),
    );
  }
}
