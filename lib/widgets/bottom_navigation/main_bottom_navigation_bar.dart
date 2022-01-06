import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/tab_item.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const MainBottomNavigationBar({Key? key, required this.currentTab, required this.onSelectTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedItemColor = Theme.of(context).primaryColor;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.myResult, selectedItemColor),
        _buildItem(TabItem.myClub, selectedItemColor),
        _buildItem(TabItem.search, selectedItemColor),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: selectedItemColor,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, Color selectedItemColor) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
        color: currentTab == tabItem ? selectedItemColor : Colors.grey,
      ),
      label: tabName[tabItem],
    );
  }
}
