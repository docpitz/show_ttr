import 'package:flutter/material.dart';

enum TabItem { myResult, myClub, search }

const Map<TabItem, String> tabName = {
  TabItem.myResult: 'Mein TTR',
  TabItem.myClub: 'Mein Verein',
  TabItem.search: 'Suche',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.myResult: Icons.person,
  TabItem.myClub: Icons.home,
  TabItem.search: Icons.search,
};
