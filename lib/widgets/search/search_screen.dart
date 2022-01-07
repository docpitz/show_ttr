import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/search/search_tab_citeria.dart';
import 'package:show_ttr/widgets/search/search_tab_name.dart';
import 'package:show_ttr/widgets/util/logout_button.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/testPage";

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: LogoutButton(doLogout: () {
            MainBottomNavigation.doLogout(context);
          },),
          title: const Text("Suche"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Name"),
              Tab(text: "Kriterien"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabSearchName(),
            TabSearchCiteria(),
          ],
        ),
      ),
    );
  }
}
