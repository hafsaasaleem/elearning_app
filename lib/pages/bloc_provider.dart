import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in/bloc/signin_blocs.dart';
import 'sign_up/bloc/signup_blocs.dart';
import 'welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ];
}
