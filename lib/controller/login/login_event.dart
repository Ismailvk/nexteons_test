part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginButtonEvent(
      {required this.email, required this.password, required this.context});
}
