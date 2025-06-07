import 'package:flutter/material.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';

class HeaderWidget extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final String titleText;
  const HeaderWidget({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              onTap();
            },
            icon: Icon(
              iconData,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12.0),
          Text(titleText, style: AppTypography.authHeaderTextStyle(context)),
        ],
      ),
    );
  }
}
