// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import '../../../common/values/constant.dart';
import '../../../global.dart';

class LandingPage extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String subTitle;
  final int index;
  final String buttonName;
  final String imagePath;
  final PageController pageController;
  const LandingPage({
    Key? key,
    required this.context,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.buttonName,
    required this.imagePath,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            color: AppColors.primaryText,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12.h),
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primarySecondaryElementText,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
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
              buttonName,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
