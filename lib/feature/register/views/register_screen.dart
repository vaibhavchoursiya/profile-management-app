import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/register/bloc/register_bloc.dart';
import 'package:profile_management_app/feature/register/bloc/register_event.dart';
import 'package:profile_management_app/feature/register/bloc/register_state.dart';
import 'package:profile_management_app/feature/register/widgets/register_form_widget.dart';
import 'package:profile_management_app/feature/register/widgets/register_header_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:profile_management_app/shared/widgets/loading_model_barrier_widget.dart';
import 'package:profile_management_app/shared/widgets/show_snack_bar_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  resetStateAndGo(BuildContext context) {
    resetState(context);
    context.go("/login");
  }

  resetState(BuildContext context) {
    final RegisterBloc registerBloc = context.read<RegisterBloc>();
    registerBloc.add(RegisterStateReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              final stateStatus = state.stateStatusModel;
              if (stateStatus.status == Status.failed) {
                showSnackBarWidget(
                  context,
                  stateStatus.message,
                  const Color.fromRGBO(255, 82, 82, 1),
                );

                /// Reset state
                resetState(context);
              } else if (stateStatus.status == Status.success) {
                showSnackBarWidget(context, stateStatus.message, Colors.green);

                // resetState and go
                resetStateAndGo(context);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: HelperMethods.getResponsiveHeight(context) * 0.08,
                    ),
                    RegisterHeaderWidget(),
                    RegisterFormWidget(),
                    // FooterWaveWidget(),
                  ],
                ),
              );
            },
          ),

          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen:
                (previous, current) =>
                    previous.stateStatusModel != current.stateStatusModel,
            builder: (context, state) {
              if (state.stateStatusModel.status == Status.loading) {
                return LoadingModelBarrierWidget();
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
