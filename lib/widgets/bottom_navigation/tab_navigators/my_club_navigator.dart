import 'package:flutter/material.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/player/club_players_page.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';
import 'package:show_ttr/widgets/result/results_page.dart';

class MyClubNavigatorRoutes {
  static const root = ClubPlayerPage.routeName;
  static const player_detail = PlayerDetailPage.routeName;
  static const player_result = ResultPage.routeName;
}

class MyClubNavigatorRouter {
  static Route? generateRoute(RouteSettings settings, BuildContext mainContext) {
    switch (settings.name) {
      case MyClubNavigatorRoutes.root:
        return MaterialPageRoute(builder: (_) => ClubPlayerPage(doLogout: () {
          MainBottomNavigation.doLogout(mainContext);
        },));
      case MyClubNavigatorRoutes.player_detail:
        return MaterialPageRoute(
            builder: (_) => PlayerDetailPage(Player.examples[1]));
      case MyClubNavigatorRoutes.player_result:
        return MaterialPageRoute(builder: (_) => ResultPage());
    }
    return null;
  }
}

class MyClubNavigator extends StatelessWidget {
  MyClubNavigator({required this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: MyClubNavigatorRoutes.root,
      onGenerateRoute: (setting) {
        return MyClubNavigatorRouter.generateRoute(setting, context);
      },
    );
  }
}
