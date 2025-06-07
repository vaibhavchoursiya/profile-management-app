import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:profile_management_app/feature/home/widgets/home_nav_bar.dart';

import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        ],
      ),
    );
  }
}
