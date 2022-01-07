import 'package:flutter/material.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/player/club_players_page.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';
import 'package:show_ttr/widgets/result/results_page.dart';

class MyClubNavigatorRoutes {
  static const root = ClubPlayerPage.routeName;
  static const playerDetail = PlayerDetailPage.routeName;
  static const playerResult = ResultPage.routeName;
}

class MyClubNavigatorRouter {
  static Route? generateRoute(RouteSettings settings, BuildContext mainContext) {
    switch (settings.name) {
      case MyClubNavigatorRoutes.root:
        return MaterialPageRoute(builder: (_) => ClubPlayerPage(doLogout: () {
          MainBottomNavigation.doLogout(mainContext);
        },));
      case MyClubNavigatorRoutes.playerDetail:
        return MaterialPageRoute(
            builder: (_) => PlayerDetailPage(Player.examples[1]));
      case MyClubNavigatorRoutes.playerResult:
        return MaterialPageRoute(builder: (_) => ResultPage());
    }
    return null;
  }
}

class MyClubNavigator extends StatelessWidget {
  const MyClubNavigator({Key? key, required this.navigatorKey}) : super(key: key);

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
