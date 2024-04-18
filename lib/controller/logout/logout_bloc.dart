import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test_1/services/shared_preferences.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutButtonEvent>(logoutButtonEvent);
  }

  FutureOr<void> logoutButtonEvent(
      LogoutButtonEvent event, Emitter<LogoutState> emit) {
    SharedPreference.instance.removeToken();
    emit(LogoutSuccessState());
  }
}
