// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    titleTextStyle: TextStyle(
      color: AppColors.primaryText,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
    ),
    title: const Text("Log In"),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
  );
}

class ThirdPartyLogIn extends StatelessWidget {
  final BuildContext context;
  const ThirdPartyLogIn({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ReuseableIcon(iconpath: 'google'),
          ReuseableIcon(iconpath: "apple"),
          ReuseableIcon(iconpath: "facebook"),
        ],
      ),
    );
  }
}

class ReuseableIcon extends StatelessWidget {
  final String iconpath;
  const ReuseableIcon({Key? key, required this.iconpath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset("assets/icons/$iconpath.png"),
      ),
    );
  }
}

class ReuseableText extends StatelessWidget {
  final String text;
  const ReuseableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final String textType;
  final String icon;
  final Function(String value)? onchange;
  const CustomTextField({
    Key? key,
    required this.hinttext,
    required this.textType,
    required this.icon,
    required this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17.w),
      margin: EdgeInsets.only(bottom: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryForthElementText),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/$icon.png"),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => onchange!(value),
              autocorrect: false,
              obscureText: textType == 'password' ? true : false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hinttext,
                  hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  )),
              style: const TextStyle(
                fontFamily: 'Avenir',
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryElement,
            // fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final String textType;
  final Function()? func;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.textType,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          top: textType == "signUp" ? 20.sp : 40.sp,
          bottom: textType == "signUp" ? 30.sp : 0,
        ),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: textType == "signUp"
              ? AppColors.primaryBackground
              : AppColors.primaryElement,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: textType == "signUp"
                ? AppColors.primaryForthElementText
                : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: textType == "signUp"
                ? AppColors.primaryText
                : AppColors.primaryBackground,
          ),
        ),
      ),
    );
  }
}
