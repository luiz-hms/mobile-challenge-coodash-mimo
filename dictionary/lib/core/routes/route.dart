import 'package:dictionary/presentation/screens/auth/login/login.dart';
import 'package:dictionary/presentation/screens/auth/register/reegister.dart';
import 'package:dictionary/core/routes/named_routes.dart';
import 'package:dictionary/presentation/screens/mainlayout/main_layout.dart';
import 'package:dictionary/presentation/screens/splash_screen.dart';
import 'package:dictionary/presentation/screens/word_detail/word_detail.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static final routes = {
    NamedRoute.splash: (_) => const SplashScreen(),
    NamedRoute.login: (_) => const LoginPage(),
    NamedRoute.register: (_) => const RegisterPage(),
    NamedRoute.main: (_) => const MainLayout(),
    NamedRoute.wordDetail: (_) => const WordDetail(),

    /*
    //NamedRoute.home: (_) => const HomePage(),
    NamedRoute.homePageOne: (_) => const HomePageOne(),
    NamedRoute.pageOne: (_) => const PageOne(),
    NamedRoute.homePageTwo: (_) => const HomePageTwo(),
    NamedRoute.pageTwo:
        (context) => _openPageWithArguments<String>(
          context,
          (text) => PageTwo(text: text),
        ),
    NamedRoute.homePageThree: (_) => const HomePageThree(),
    NamedRoute.pageThree:
        (context) => _openPageWithArguments<String>(
          context,
          (text) => PageThree(text: text),
        ),
        */
  };

  static Widget _openPageWithArguments<T>(
    BuildContext context,
    Widget Function(T) onPage,
  ) {
    final args = ModalRoute.of(context)!.settings.arguments as T;
    return onPage(args);
  }
}
