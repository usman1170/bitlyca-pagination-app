import 'package:bitlyca_app/data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;

  UserLoaded({required this.users});
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}
