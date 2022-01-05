import 'dart:math';
import 'package:flutter/material.dart';

import 'package:show_ttr/models/Competition.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:show_ttr/widgets/player/player_detail_page_chart.dart';
import 'package:show_ttr/widgets/player/player_detail_page_list.dart';

class PlayerDetailStateModel {
  int selectedValue = -1;
  bool shouldScrollTo = false;
  bool showChart = true;
  bool maxChart = false;
  List<Competition> competitionsItems =
  List.from(Competition.items[Random.secure().nextInt(3)]);
}

class PlayerDetailPage extends StatefulWidget {
  static const routeName = '/playerDetail';

  const PlayerDetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetailPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;
  final PlayerDetailStateModel _stateModel = PlayerDetailStateModel();
  late PlayerDetailPageList _detailPageList;
  late PlayerDetailPageChart _detailPageChart;

  _PlayerDetailState() {
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
    
    return _playerDetailPage(context);
  }

  Widget _playerDetailPage(BuildContext context) {
    final player = ModalRoute.of(context)!.settings.arguments as Player;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(player.firstname +
              " " +
              player.lastname +
              " (" +
              player.points.toString() +
              ")"),
          actions: [
            TextButton(
              onPressed: () {
                switchChartOnOff();
              },
              style: TextButton.styleFrom(
                  primary: Theme.of(context).colorScheme.onPrimary),
              child: const Text("Chart"),
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
                          ? (_stateModel.maxChart ? constraints.maxHeight - 65 : 200)
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
