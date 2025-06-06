import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/config/app_theme/app_typography.dart';
import 'package:profile_management_app/feature/register/bloc/register_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_event.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              final registerBloc = context.read<RegisterBloc>();
              registerBloc.add(RegisterStateReset());
              context.go("/login");
            },
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
            style: AppTypography.authHeaderTextStyle(context),
          ),
        ],
      ),
    );
  }
}
