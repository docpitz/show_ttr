import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/player/club_players_page.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';
import 'package:show_ttr/widgets/player/results_page.dart';
import 'package:show_ttr/widgets/test_page.dart';
import 'widgets/login_page.dart';

void main() {
  runApp(const MyTischtennisApp());
}

class MyTischtennisApp extends StatelessWidget {
  const MyTischtennisApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myTischtennis',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        ClubPlayerPage.routeName: (context) => ClubPlayerPage(),
        PlayerDetailPage.routeName: (context) => PlayerDetailPage(),
        TestPage.routeName: (context) => TestPage(),
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}
