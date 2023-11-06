import 'package:elearning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppPages.generateRouteSettings,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: AppColors.primaryText),
                    elevation: 0,
                    color: Colors.white)),
          );
        },
      ),
    );
  }
}
