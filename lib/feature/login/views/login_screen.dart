import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/login/bloc/login_bloc.dart';
import 'package:profile_management_app/feature/login/bloc/login_event.dart';
import 'package:profile_management_app/feature/login/bloc/login_state.dart';
import 'package:profile_management_app/feature/login/widgets/login_form_widget.dart';
import 'package:profile_management_app/feature/login/widgets/login_header_widget.dart';
import 'package:profile_management_app/feature/register/widgets/register_header_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:profile_management_app/shared/widgets/loading_model_barrier_widget.dart';
import 'package:profile_management_app/shared/widgets/show_snack_bar_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  resetStateAndGo(BuildContext context) {
    resetState(context);
    context.go("/home");
  }

  resetState(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    loginBloc.add(LoginStateReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final stateStatus = state.stateStatusModel;
              if (stateStatus.status == Status.failed) {
                showSnackBarWidget(
                  context,
                  stateStatus.message,
                  const Color.fromRGBO(255, 82, 82, 1),
                );

                ///  Reset state
                resetState(context);
              } else if (stateStatus.status == Status.success) {
                showSnackBarWidget(context, stateStatus.message, Colors.green);

                // resetState and go
                resetStateAndGo(context);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: HelperMethods.getResponsiveHeight(context) * 0.08,
                  ),

                  LoginHeaderWidget(),
                  LoginFormWidget(),

                  // FooterWaveWidget(),
                ],
              ),
            ),
          ),

          BlocBuilder<LoginBloc, LoginState>(
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
