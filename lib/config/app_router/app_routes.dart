import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/login/views/login_screen.dart';
import 'package:profile_management_app/feature/login/widgets/login_form_widget.dart';
import 'package:profile_management_app/feature/register/views/register_screen.dart';
import 'package:profile_management_app/sample_screen.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: "/login",
    routes: <GoRoute>[
      GoRoute(
        path: "/register",
        name: "/register",
        builder: (context, state) => RegisterScreen(),
      ),

      GoRoute(
        path: "/login",
        name: "/login",
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: "/change_password",
        name: "/change_password",
        builder: (context, state) => SampleScreen(),
      ),
      GoRoute(
        path: "/home",
        name: "/home",
        builder: (context, state) => SampleScreen(),
      ),

      GoRoute(
        path: "/profile_management",
        name: "/profile_management",
        builder: (context, state) => SampleScreen(),
      ),

      GoRoute(
        path: "/profile_view",
        name: "/profile_view",
        builder: (context, state) => SampleScreen(),
      ),

      GoRoute(
        path: "/add_post",
        name: "/add_post",
        builder: (context, state) => SampleScreen(),
      ),
      GoRoute(
        path: "/update_post",
        name: "/update_post",
        builder: (context, state) => SampleScreen(),
      ),
    ],
  );
}
