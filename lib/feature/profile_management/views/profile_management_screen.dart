import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:profile_management_app/feature/profile_management/widgets/profile_management_form_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/widgets/header_widget.dart';

class ProfileManagementScreen extends StatelessWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: HelperMethods.getResponsiveHeight(context) * 0.04),
            HeaderWidget(
              onTap: () {
                context.pop();
              },
              iconData: Icons.arrow_back,
              titleText: "Manage profile",
            ),
            ProfileFormWidget(),
          ],
        ),
      ),
    );
  }
}
