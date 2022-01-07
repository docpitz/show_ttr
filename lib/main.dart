import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_navigator_routes.dart';


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
      initialRoute: MainNavigatorRoutes.login,
      onGenerateRoute: MainNavigatorRouter.generateRoute,
    );
  }
}
