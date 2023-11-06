// ignore_for_file: public_member_api_docs, sort_constructors_first
// unify blocProvider and routes and pages
import 'package:elearning/common/routes/names.dart';
import 'package:elearning/pages/application/application_page.dart';
import 'package:elearning/pages/sign_in/bloc/signin_blocs.dart';
import 'package:elearning/pages/sign_in/sign_in.dart';
import 'package:elearning/pages/sign_up/bloc/signup_blocs.dart';
import 'package:elearning/pages/sign_up/sign_up.dart';
import 'package:elearning/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global.dart';
import '../../pages/application/bloc/app_blocs.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.welcome,
        page: const Welcome(),
        bloc: BlocProvider(create: (context) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(create: (context) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.signUp,
        page: const SignUp(),
        bloc: BlocProvider(create: (context) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (context) => AppBlocs()),
      ),
    ];
  }

// return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.welcome && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid route name ${settings.name}");

    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
