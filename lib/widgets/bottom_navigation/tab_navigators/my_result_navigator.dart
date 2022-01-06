import 'dart:math';

import 'package:flutter/material.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_navigator_routes.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';
import 'package:show_ttr/widgets/result/results_page.dart';

class MyResultNavigatorRoutes {
  static const String root = "/";
  static const String playerDetail = PlayerDetailPage.routeName;
  static const String result = ResultPage.routeName;
}

class MyResultNavigatorRouter {
  static Route? generateRoute(
      RouteSettings settings, BuildContext mainContext) {
    switch (settings.name) {
      case MyResultNavigatorRoutes.root:
        return MaterialPageRoute(
          builder: (_) => PlayerDetailPage(
            Player.examples[5],
            showLogoutIcon: true,
            doLogout: () {
              MainBottomNavigation.doLogout(mainContext);
            },
          ),
        );
      case MyResultNavigatorRoutes.playerDetail:
        return MaterialPageRoute(
          builder: (_) => PlayerDetailPage(
            Player.examples[Random.secure().nextInt(6)],
          ),
        );
      case MyResultNavigatorRoutes.result:
        //final result = settings.arguments as Result;
        return MaterialPageRoute(
          builder: (_) => ResultPage(),
          //builder: (_) => TransactionDetails(transaction: transaction)
          // fullscreenDialog: false,
        );
    }

    return null;
  }
}

class MyResultNavigator extends StatelessWidget {
  MyResultNavigator({required this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: MyResultNavigatorRoutes.root,
      onGenerateRoute: (setting) {
        return MyResultNavigatorRouter.generateRoute(setting, context);
      },
    );
  }
}
