import 'package:elearning/pages/sign_up/bloc/signup_events.dart';
import 'package:elearning/pages/sign_up/bloc/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBloc() : super(const SignUpStates()) {
    on<UserNameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _usernameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    print("username : ${event.username}");
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    print("email : ${event.email}");

    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    print("password : ${event.password}");

    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<SignUpStates> emit) {
    print("confirmpassword : ${event.confirmPassword}");

    emit(state.copyWith(confirmpassword: event.confirmPassword));
  }
}
