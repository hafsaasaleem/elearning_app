import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:elearning/pages/welcome/bloc/welcome_events.dart';
import 'package:elearning/pages/welcome/widgets/landing_page.dart';
import '../../common/values/colors.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 35.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    
                    controller: _pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      LandingPage(
                        pageController: _pageController,
                        context: context,
                        title: "First See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge in one learning!",
                        index: 1,
                        buttonName: "Next",
                        imagePath: "assets/images/reading.png",
                      ),
                      LandingPage(
                        pageController: _pageController,
                        context: context,
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor & friend. let's get connected!",
                        index: 2,
                        buttonName: "Next",
                        imagePath: "assets/images/boy.png",
                      ),
                      LandingPage(
                        pageController: _pageController,
                        context: context,
                        title: "Always Fascinated Learning",
                        subTitle:
                            "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                        index: 3,
                        buttonName: "Get Started",
                        imagePath: "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 30.h,
                    child: DotsIndicator(
                      // position: state.page.toDouble(),
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        activeSize: const Size(18.0, 8.0),
                        size: const Size.square(8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
