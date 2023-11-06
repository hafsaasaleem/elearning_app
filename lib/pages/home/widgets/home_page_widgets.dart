import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        SizedBox(
          height: 12.h,
          width: 15.w,
          child: Image.asset("assets/icons/menu.png"),
        ),
        GestureDetector(
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/person.png"),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
