import 'package:elearning/pages/sign_up/bloc/signup_blocs.dart';
import 'package:elearning/pages/sign_up/bloc/signup_controller.dart';
import 'package:elearning/pages/sign_up/bloc/signup_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common_widgets.dart';
import 'bloc/signup_states.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc,SignUpStates>(
      builder: (context,state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign Up', () {
                Navigator.of(context).pop();
              }),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const Center(
                      child: ReuseableText(
                          text: "Enter your details below & free sign up"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReuseableText(text: "User name"),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hinttext: "Enter your user name",
                            textType: "name",
                            icon: 'user',
                            onchange: (value) {
                              context.read<SignUpBloc>().add(UserNameEvent(value));
                            },
                          ),
                          const ReuseableText(text: "Email"),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hinttext: "Enter your email address",
                            textType: "email",
                            icon: 'user',
                            onchange: (value) {
                              context.read<SignUpBloc>().add(EmailEvent(value));
                            },
                          ),
                          const ReuseableText(text: "Password"),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hinttext: "Enter your password",
                            textType: "password",
                            icon: 'lock',
                            onchange: (value) {
                              context.read<SignUpBloc>().add(PasswordEvent(value));
                            },
                          ),
                          const ReuseableText(text: "Confirm Password"),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hinttext: "Enter your Confirm Password",
                            textType: "password",
                            icon: 'lock',
                            onchange: (value) {
                              context.read<SignUpBloc>().add(ConfirmPasswordEvent(value));
                            },
                          ),
                          const ReuseableText(
                              text:
                                  "By creating your account you have to agree with our terms & conditions.")
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      text: "Sign Up",
                      textType: 'signUp!',
                      func: () {
                        SignUpController(context: context).handleSignUp();
                        // SignInController(context: context).handleSignIn("email");
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
