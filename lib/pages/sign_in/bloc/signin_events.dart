// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent(this.password);
}
