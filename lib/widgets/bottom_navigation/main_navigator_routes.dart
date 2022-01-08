import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/login_page.dart';
import 'package:show_ttr/widgets/test_page.dart';

class MainNavigatorRoutes {
  static const String login = "/";
  static const String loggedIn = '/loggedIn';
  static const String test = '/test';
}

class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigatorRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: const RouteSettings(name: MainNavigatorRoutes.login),
          fullscreenDialog: true,
        );
      case MainNavigatorRoutes.loggedIn:
        return MaterialPageRoute(
          builder: (_) => const MainBottomNavigation(),
          settings: const RouteSettings(name: MainNavigatorRoutes.loggedIn),
        );
      case MainNavigatorRoutes.test:
        return MaterialPageRoute(
          builder: (_) => const TestPage(),
          settings: const RouteSettings(name: TestPage.routeName),
        );
    }
    return null;
  }
}
