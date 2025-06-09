import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/home/bloc/home_bloc.dart';
import 'package:profile_management_app/feature/home/bloc/home_event.dart';
import 'package:profile_management_app/feature/home/bloc/home_state.dart';

import 'package:profile_management_app/feature/home/widgets/home_nav_bar.dart';
import 'package:profile_management_app/feature/home/widgets/user_card.dart';

import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:user_api/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Column(
        children: [
          SizedBox(height: HelperMethods.getResponsiveHeight(context) * 0.04),
          HomeNavBar(),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final UserModel user = state.users[index];
                    return UserCard(user: user);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
