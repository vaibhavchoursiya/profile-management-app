import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/home/bloc/home_bloc.dart';
import 'package:profile_management_app/feature/home/bloc/home_event.dart';
import 'package:profile_management_app/feature/home/bloc/home_state.dart';

import 'package:profile_management_app/feature/home/widgets/home_nav_bar.dart';
import 'package:profile_management_app/feature/home/widgets/user_card.dart';

import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:profile_management_app/shared/widgets/loading_model_barrier_widget.dart';
import 'package:profile_management_app/shared/widgets/mtext_form_field.dart';
import 'package:user_api/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialize();
    });
  }

  Future<void> initialize() async {
    final HomeBloc homeBloc = context.read<HomeBloc>();
    homeBloc.add(HomeDataLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/profile_management");
        },
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: HelperMethods.getResponsiveHeight(context) * 0.04,
                ),
                HomeNavBar(),

                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: MsearchFormField(
                    controller: searchController,
                    hintText: "Search profile name...",
                    textInputType: TextInputType.text,
                  ),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final UserModel user = state.users[index];
                        return UserCard(user: user);
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          BlocBuilder<HomeBloc, HomeState>(
            buildWhen:
                (previous, current) =>
                    previous.stateStatusModel != current.stateStatusModel,
            builder: (context, state) {
              if (state.stateStatusModel.status == Status.loading) {
                return SizedBox(
                  width: double.infinity,
                  height: HelperMethods.getResponsiveHeight(context),
                  child: Stack(children: [LoadingModelBarrierWidget()]),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
