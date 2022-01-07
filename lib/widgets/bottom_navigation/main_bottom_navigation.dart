import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation_bar.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_navigator_routes.dart';
import 'package:show_ttr/widgets/bottom_navigation/tab_navigators/my_club_navigator.dart';
import 'package:show_ttr/widgets/bottom_navigation/tab_navigators/my_result_navigator.dart';
import 'package:show_ttr/widgets/bottom_navigation/tab_item.dart';
import 'package:show_ttr/widgets/search/search_screen.dart';

class MainBottomNavigation extends StatefulWidget {

  static void doLogout(BuildContext mainContext) {
    Navigator.of(mainContext)
        .popUntil(ModalRoute.withName(MainNavigatorRoutes.login));
  }

  const MainBottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  var _currentTab = TabItem.myResult;

  // Navigator key used for nested navigation in the home page
  final _myResultNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "MyResultNavigatorKey");
  final _myClubNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "MyClubNavigatorKey");

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      if (_currentTab == TabItem.myResult) {
        // pop to first route
        _myResultNavigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
      else if (_currentTab == TabItem.myClub) {
        // pop to first route
        _myClubNavigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('MainNavigation rebuild');
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab == TabItem.myResult) {
          return !await _myResultNavigatorKey.currentState!.maybePop();
        }
        if (_currentTab == TabItem.myClub) {
          return !await _myClubNavigatorKey.currentState!.maybePop();
        }
        return true;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentTab.index,
          children: [
            MyResultNavigator(navigatorKey: _myResultNavigatorKey),
            MyClubNavigator(navigatorKey: _myClubNavigatorKey),
            const SearchPage(),
          ],
        ),
        bottomNavigationBar: MainBottomNavigationBar(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}
