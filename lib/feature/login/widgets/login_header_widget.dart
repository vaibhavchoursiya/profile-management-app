import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTypography.bodyPaddingHorizontal,
      ),
      child: SvgPicture.asset(
        "assets/images/login.svg",
        width: double.infinity,
        height: HelperMethods.getResponsiveHeight(context) * 0.3,
      ),
    );
  }
}
