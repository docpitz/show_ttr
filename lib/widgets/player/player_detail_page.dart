import 'package:flutter/material.dart';

import 'package:show_ttr/models/Competition.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/widgets/player/player_detail_page_chart.dart';
import 'package:show_ttr/widgets/player/player_detail_page_list.dart';
import 'package:show_ttr/widgets/util/logout_button.dart';

class PlayerDetailStateModel {
  int selectedValue = -1;
  bool shouldScrollTo = false;
  bool showChart = true;
  bool maxChart = false;
  List<Competition> competitionsItems = List.from(Competition.items[1]);
}

class PlayerDetailPage extends StatefulWidget {
  static const routeName = '/playerDetail';
  final Player? _player;
  final bool showLogoutIcon;
  final VoidCallback? doLogout;

  const PlayerDetailPage(this._player,
      {this.showLogoutIcon = false, this.doLogout, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerDetailState(_player,
      showLogoutIcon: this.showLogoutIcon, doLogout: this.doLogout);
}

class _PlayerDetailState extends State<PlayerDetailPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;
  final PlayerDetailStateModel _stateModel = PlayerDetailStateModel();
  late PlayerDetailPageList _detailPageList;
  late PlayerDetailPageChart _detailPageChart;
  Player? _player;
  final bool showLogoutIcon;
  final VoidCallback? doLogout;

  _PlayerDetailState(this._player,
      {required this.showLogoutIcon, this.doLogout}) {
    _detailPageList = PlayerDetailPageList(_stateModel);
    _detailPageChart = PlayerDetailPageChart(_stateModel);
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    switchChartOnOff();
    _animationController.addListener(() {});
  }

  void switchChartOnOff() {
    _stateModel.showChart
        ? _animationController.reverse()
        : _animationController.forward();
    setState(() {
      _stateModel.showChart = !_stateModel.showChart;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _player ??= ModalRoute.of(context)!.settings.arguments as Player;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: !showLogoutIcon ? null : LogoutButton(doLogout: doLogout),
          title: Center(
            child: Column(
              children: [
                Text(_player!.firstname +
                    " " +
                    _player!.lastname +
                    " (" +
                    _player!.points.toString() +
                    ")"),
                const Text(
                  "TSV Hofolding",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: () {
                switchChartOnOff();
              },
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: Visibility(
                    visible: _stateModel.showChart,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedContainer(
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 500),
                      height: _stateModel.showChart
                          ? (_stateModel.maxChart
                              ? constraints.maxHeight - 65
                              : 200)
                          : 75,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 12, 15),
                          child: _detailPageChart.buildTTRChart(context, this),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _detailPageList.buildList(context, this),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
