import 'package:elearning/common/widgets/flutter_toast.dart';
import 'package:elearning/pages/sign_up/bloc/signup_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({required this.context});

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String confirmpassword = state.confirmpassword;

    if (username.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (confirmpassword.isEmpty) {
      toastInfo(msg: "Your Password Confirmation is wrong");
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                "An email has been sent to your signup email. To activate it please check your email box and click on the link.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'This email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email id is invalid');
      }
    }
  }
}
