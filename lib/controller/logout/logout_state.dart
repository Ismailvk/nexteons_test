part of 'logout_bloc.dart';

sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutSuccessState extends LogoutState {}
