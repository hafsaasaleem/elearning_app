class SignUpStates {
  final String username;
  final String email;
  final String password;
  final String confirmpassword;
  const SignUpStates({
    this.email = '',
    this.password = '',
    this.confirmpassword = '',
    this.username = '',
  });

  SignUpStates copyWith({
    String? email,
    String? password,
    String? confirmpassword,
    String? username,
  }) {
    return SignUpStates(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
    );
  }
}
