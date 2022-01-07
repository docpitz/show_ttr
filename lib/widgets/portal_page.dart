import 'package:flutter/material.dart';
import 'package:show_ttr/widgets/bottom_navigation/main_bottom_navigation.dart';
import 'package:show_ttr/widgets/util/logout_button.dart';
import 'package:show_ttr/widgets/util/hex_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum PortalTabItem {
  topsport, panorama, training, community
}

const Map<PortalTabItem, String> tabName = {
  PortalTabItem.topsport: 'Top-Sport',
  PortalTabItem.panorama: 'Panorama',
  PortalTabItem.training: 'Training',
  PortalTabItem.community: 'Community'
};

const Map<PortalTabItem, IconData> tabIcon = {
  PortalTabItem.topsport: Icons.sports,
  PortalTabItem.panorama: Icons.panorama,
  PortalTabItem.training: Icons.accessibility_new_sharp,
  PortalTabItem.community: Icons.person,
};

const Map<PortalTabItem, String> _tabUrl = {
  PortalTabItem.topsport: "https://www.mytischtennis.de/public/topsport/",
  PortalTabItem.panorama: "https://www.mytischtennis.de/public/panorama/",
  PortalTabItem.training: "https://www.mytischtennis.de/public/training/",
};

class PortalPage extends StatefulWidget {
  static const routeName = "/portal";
  final Function()? onFlip;

  const PortalPage({Key? key, this.onFlip}) : super(key: key);

  @override
  State<PortalPage> createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage> {
  PortalTabItem _currentTab = PortalTabItem.topsport;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoutButton(
          doLogout: () {
            MainBottomNavigation.doLogout(context);
          },
        ),
        backgroundColor: Colors.blue,
        title: const Text('Portal'),
      ),
      body: WebView(
        initialUrl: _tabUrl[_currentTab],
        onWebViewCreated: (controller) {
          _webViewController = controller;
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: PortalTabItem.values.map((e) => _buildItem(e)).toList(),
        currentIndex: _currentTab.index,
        selectedItemColor: HexColor.fromHex("#0094D8"),
        onTap: (index) {
          setState(() {
            _currentTab = PortalTabItem.values[index];
            if (_currentTab != PortalTabItem.community) {
              _webViewController.loadUrl(_tabUrl[_currentTab]!);
            }
          });
          if (_currentTab == PortalTabItem.community) {
            widget.onFlip!();
          }
        },
      ),
    );
  }

  BottomNavigationBarItem _buildItem(PortalTabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
      ),
      label: tabName[tabItem],
    );
  }
}
