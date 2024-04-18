import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_1/services/api_services.dart';
import 'package:test_1/services/shared_preferences.dart';
import 'package:test_1/views/home_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonEvent>(loginButtonEvent);
  }

  FutureOr<void> loginButtonEvent(
      LoginButtonEvent event, Emitter<LoginState> emit) async {
    final response =
        await ApiService.instance.loginUser(event.email, event.password);
    print(response.statusCode);
    try {
      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        await SharedPreference.instance.storeToken(body['token']);
        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      }
    } catch (e) {
      emit(LoginFailedState(message: 'Something Went Wrong'));
    }
  }
}
