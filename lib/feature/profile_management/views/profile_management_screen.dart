import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_bloc.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_event.dart';
import 'package:profile_management_app/feature/profile_management/bloc/profile_management_state.dart';

import 'package:profile_management_app/feature/profile_management/widgets/profile_management_form_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:profile_management_app/shared/widgets/header_widget.dart';
import 'package:profile_management_app/shared/widgets/loading_model_barrier_widget.dart';

class ProfileManagementScreen extends StatefulWidget {
  const ProfileManagementScreen({super.key});

  @override
  State<ProfileManagementScreen> createState() =>
      _ProfileManagementScreenState();
}

class _ProfileManagementScreenState extends State<ProfileManagementScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialize();
    });
  }

  Future<void> initialize() async {
    final ProfileManagementBloc profileManagementBloc =
        context.read<ProfileManagementBloc>();
    profileManagementBloc.add(ProfileManagementDataLoaded());
  }

  resetStateAndPop(BuildContext context) {
    final profileManagementBloc = context.read<ProfileManagementBloc>();
    context.pop();
    profileManagementBloc.add(ProfileManagementStateReset());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        resetStateAndPop(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: HelperMethods.getResponsiveHeight(context) * 0.04,
                  ),
                  HeaderWidget(
                    onTap: () {
                      resetStateAndPop(context);
                    },
                    iconData: Icons.arrow_back,
                    titleText: "Manage profile",
                  ),
                  ProfileFormWidget(),
                ],
              ),
            ),

            BlocBuilder<ProfileManagementBloc, ProfileManagementState>(
              buildWhen:
                  (previous, current) =>
                      previous.stateStatusModel != current.stateStatusModel,
              builder: (context, state) {
                if (state.stateStatusModel.status == Status.loading ||
                    state.stateStatusModel.status == Status.success) {
                  return LoadingModelBarrierWidget();
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
