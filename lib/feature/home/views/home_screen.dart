import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/login/bloc/login_bloc.dart';
import 'package:profile_management_app/feature/login/bloc/login_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asdfkl"),
        actions: [
          IconButton(
            onPressed: () {
              final LoginBloc loginBloc = context.read<LoginBloc>();
              loginBloc.add(LogoutPressed());
              context.go("/login");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
