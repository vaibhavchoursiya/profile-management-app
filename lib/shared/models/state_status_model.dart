import 'package:equatable/equatable.dart';

enum Status {
  initial,
  loading,
  success,
  failed,
  authorized,
  unauthorized,
  logout,
  loaded,
}

class StateStatusModel extends Equatable {
  final Status status;
  final String message;

  const StateStatusModel({required this.status, required this.message});

  @override
  List<Object?> get props => [status, message];
}
