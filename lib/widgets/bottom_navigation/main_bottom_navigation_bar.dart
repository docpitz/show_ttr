import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/tab_item.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final VoidCallback? onFlip;

  const MainBottomNavigationBar(
      {Key? key,
      required this.currentTab,
      required this.onSelectTab,
      this.onFlip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedItemColor = Theme.of(context).primaryColor;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: TabItem.values.map((e) => _buildItem(e, selectedItemColor)).toList(),
      onTap: (index) {
        if (index < 3) {
          onSelectTab(TabItem.values[index]);
        } else {
          onFlip!();
        }
      },
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
