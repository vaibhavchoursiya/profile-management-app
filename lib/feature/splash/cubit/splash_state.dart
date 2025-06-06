import 'package:equatable/equatable.dart';

final class SplashState extends Equatable {
  final bool isUserLogged;

  const SplashState({required this.isUserLogged});

  @override
  List<Object> get props => [isUserLogged];
}
