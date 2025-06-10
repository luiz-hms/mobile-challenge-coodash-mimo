import 'package:dictionary/core/routes/named_routes.dart';
import 'package:dictionary/views/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static final routes = {
    NamedRoute.splash: (_) => const SplashScreen(),
    //NamedRoute.home: (_) => const HomePage(),
    /*
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
