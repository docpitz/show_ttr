import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/login_page.dart';
import 'package:show_ttr/widgets/result/results_page.dart';

class MainNavigatorRoutes {
  static const String login = "/";
  static const String loggedIn = '/loggedIn';
  static const String result = '/result';
}

class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigatorRoutes.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: const RouteSettings(name: MainNavigatorRoutes.login),
          fullscreenDialog: true,
        );
      case MainNavigatorRoutes.loggedIn:
        return MaterialPageRoute(
          builder: (_) => MainBottomNavigation(),
          settings: const RouteSettings(name: MainNavigatorRoutes.loggedIn),
        );
      case MainNavigatorRoutes.result:
        return MaterialPageRoute(
          builder: (_) => ResultPage(),
          settings: const RouteSettings(name: ResultPage.routeName),
        );
    }
    return null;
  }
}
