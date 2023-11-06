import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import '../../home/home_page.dart';

Widget buildPage(int index) {
  List<Widget> _widget = const [
    HomePage(),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile")),
  ];
  return _widget[index];
}

var bottomTab = [
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset("assets/icons/search2.png"),
    ),
    label: 'Search',
    activeIcon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    label: 'Course',
    activeIcon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    label: 'Chat',
    activeIcon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset("assets/icons/person2.png"),
    ),
    label: 'Profile',
    activeIcon: SizedBox(
      height: 16.h,
      width: 16.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
