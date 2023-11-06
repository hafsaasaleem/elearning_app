import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elearning/pages/sign_in/bloc/signin_blocs.dart';
import 'package:elearning/pages/sign_in/bloc/signin_events.dart';
import 'bloc/signIn_states.dart';
import 'widgets/sign_in_controller.dart';
import 'widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThirdPartyLogIn(context: context),
                    const Center(
                      child: ReuseableText(
                          text: "or use your email account to log in"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReuseableText(text: "Email"),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hinttext: "Enter your email address",
                            textType: "email",
                            icon: 'user',
                            onchange: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          const ReuseableText(text: "Password"),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hinttext: "Enter your password",
                            textType: "password",
                            icon: 'lock',
                            onchange: (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          const ForgotPassword(),
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      text: "Log In",
                      textType: 'LogIn',
                      func: () {
                        SignInController(context: context)
                            .handleSignIn("email");
                      },
                    ),
                    CustomElevatedButton(
                      text: "Sign Up",
                      textType: 'signUp',
                      func: () {
                        Navigator.of(context).pushNamed("/sign_up");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
