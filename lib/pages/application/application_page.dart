import 'package:elearning/pages/application/widgets/application_widgets.dart';
import 'package:elearning/pages/application/bloc/app_blocs.dart';
import 'package:elearning/pages/application/bloc/app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/colors.dart';
import 'bloc/app_states.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  color: AppColors.primaryElement,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryForthElementText,
                  currentIndex: state.index,
                  onTap: (value) {
                    context.read<AppBlocs>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  useLegacyColorScheme: false,
                  items: bottomTab,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
