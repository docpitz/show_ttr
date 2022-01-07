import 'package:flutter/material.dart';

enum TabItem { myResult, myClub, search, news }

const Map<TabItem, String> tabName = {
  TabItem.myResult: 'Mein TTR',
  TabItem.myClub: 'Mein Verein',
  TabItem.search: 'Suche',
  TabItem.news: 'Portal'
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.myResult: Icons.person,
  TabItem.myClub: Icons.home,
  TabItem.search: Icons.search,
  TabItem.news: Icons.article,
};
