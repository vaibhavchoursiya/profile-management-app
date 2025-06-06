import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_management_app/feature/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  static SplashState get initialState => SplashState(isUserLogged: false);

  final FirebaseAuth firebaseAuth;
  SplashCubit({required this.firebaseAuth}) : super(initialState);

  checkUserLoggedIn() {
    if (firebaseAuth.currentUser != null) {
      emit(SplashState(isUserLogged: true));
    } else {
      emit(SplashState(isUserLogged: false));
    }
  }

  resetState() {
    emit(initialState);
  }
}
