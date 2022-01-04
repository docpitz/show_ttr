import 'package:flutter/material.dart';
import 'package:show_ttr/models/Competition.dart';
import 'package:show_ttr/models/Player.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/src/painting/text_style.dart' as TextStyle;
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'package:show_ttr/widgets/player/results_page.dart';

import 'package:show_ttr/widgets/util/flcahrt_double_tap_helper.dart';

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
  bool _showChart = true;
  bool _maxChart = false;
  int _selectedValue = -1;
  bool _shouldScrollTo = false;
  bool _firstRun = false;
  final ItemScrollController _itemScrollController = ItemScrollController();
  late List<FlSpot> _mappedItems;
  List<Competition> competitionsItems =
      List.from(Competition.items[Random.secure().nextInt(3)]);
  FlChartDoubleTapHelper chartDoubleTapHelper = FlChartDoubleTapHelper();

  _PlayerDetailState() {
    final competitionsItemsChart = List.from(competitionsItems);

    int endScore = competitionsItemsChart[0].pointBevor +
        competitionsItemsChart[0].pointWinning;
    competitionsItemsChart.add(
      Competition(
        competitionsItemsChart.length,
        "",
        "",
        "",
        "",
        "",
        0,
        0,
        endScore,
      ),
    );

    competitionsItemsChart.sort((a, b) => a.number.compareTo(b.number));

    _mappedItems = competitionsItemsChart
        .map((e) => FlSpot(e.number.toDouble(), e.pointBevor.toDouble()))
        .toList();
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
    _showChart
        ? _animationController.reverse()
        : _animationController.forward();
    setState(() {
      _showChart = !_showChart;
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
                    visible: _showChart,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedContainer(
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 500),
                      height: _showChart
                          ? (_maxChart ? constraints.maxHeight - 65 : 200)
                          : 75,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 12, 15),
                          child: _buildTTRChart(context),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _buildList(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTTRChart(BuildContext context) {
    List<int> showIndexes =
        _selectedValue >= 0 ? [_mappedItems.length - 1 - _selectedValue] : [];

    List<LineChartBarData> lineBarsData = [
      LineChartBarData(
          shadow: const Shadow(
            blurRadius: 5,
            color: Colors.black45,
          ),
          showingIndicators: showIndexes,
          isStrokeCapRound: true,
          isCurved: true,
          curveSmoothness: 0.15,
          colors: const [Colors.deepOrange],
          barWidth: 1.7,
          dotData: FlDotData(show: false),
          belowBarData:
              BarAreaData(show: true, colors: [Colors.deepOrange.shade50]),
          spots: _mappedItems),
    ];

    final tooltipsOnBar = lineBarsData[0];
    final showingTooltipIndicators = showIndexes.map((index) {
      return ShowingTooltipIndicators([
        LineBarSpot(tooltipsOnBar, lineBarsData.indexOf(tooltipsOnBar),
            tooltipsOnBar.spots[index]),
      ]);
    }).toList();

    List<double> listValues = _mappedItems.map((e) => e.y).toList();
    return LineChart(
      LineChartData(
        showingTooltipIndicators: showingTooltipIndicators,
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: listValues.length.toDouble() - 1,
        maxY: listValues.reduce(max) + 10,
        minY: listValues.reduce(min) - 10,
      ),
      swapAnimationCurve: Curves.ease,
      swapAnimationDuration: const Duration(milliseconds: 100),
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: _selectedValue == -1,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.deepOrange.shade100,
              ),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 3,
                  color: Colors.deepOrange.shade600,
                  strokeWidth: 1,
                  strokeColor: Colors.black54,
                ),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
            return lineBarsSpot.map((lineBarSpot) {
              return LineTooltipItem(
                lineBarSpot.y.toInt().toString(),
                const TextStyle.TextStyle(fontSize: 11, color: Colors.white),
              );
            }).toList();
          },
          tooltipPadding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
          tooltipRoundedRadius: 3,
          tooltipMargin: 10,
          rotateAngle: 1,
          tooltipBgColor: Colors.blueGrey.withOpacity(0.7),
        ),
        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
          chartDoubleTapHelper.doubleTapEvent(event, () {
            setState(() {
              _maxChart = !_maxChart;
            });
          });
          if (touchResponse == null || touchResponse.lineBarSpots == null) {
            return;
          }
          final touchedIndex = touchResponse.lineBarSpots!.first.spotIndex;
          setState(() {
            if (event is FlTapDownEvent ||
                event is FlPanDownEvent ||
                event is FlLongPressMoveUpdate ||
                event is FlPanUpdateEvent) {
              _selectedValue = _mappedItems.length - 1 - touchedIndex.toInt();
              _shouldScrollTo = true;
            }
            if (event is FlTapUpEvent ||
                event is FlLongPressEnd ||
                event is FlPanEndEvent ||
                event is FlPointerExitEvent) {
              _shouldScrollTo = false;
            }
          });
        },
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false, reservedSize: 10),
        topTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(
            showTitles: true,
            reservedSize: 23,
            margin: 5,
            getTextStyles: (context, value) => const TextStyle.TextStyle(
                  color: Colors.grey,
                  fontSize: 9,
                ),
            getTitles: (value) {
              return value.toInt().toString();
            }),
      );

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
          left: BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.none,
          ),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  @override
  Widget _buildList(BuildContext context) {
    if (_selectedValue != -1 && _shouldScrollTo && _firstRun) {
      if (_maxChart) {
        _itemScrollController.jumpTo(index: _selectedValue);
        _shouldScrollTo = false;
      } else {
        _itemScrollController
            .scrollTo(
                index: _selectedValue,
                duration: const Duration(milliseconds: 150))
            .then((value) => {
                  setState(() {
                    _shouldScrollTo = false;
                  })
                });
      }
    }

    _firstRun = true;
    return ScrollablePositionedList.separated(
      itemCount: competitionsItems.length,
      itemScrollController: _itemScrollController,
      physics: _shouldScrollTo
          ? const ClampingScrollPhysics()
          : const BouncingScrollPhysics(),
      initialScrollIndex: 0,
      itemBuilder: (context, index) {
        return listTile(context, index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  ListTile listTile(BuildContext context, int index) {
    return ListTile(
      title: Row(
        children: [
          Container(
            //duration: const Duration(milliseconds: 5000),
            //curve: Curves.slowMiddle,
            child: !_showChart
                ? null
                : Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                      width: 3,
                      height: 40,
                      color: index == _selectedValue
                          ? Colors.deepOrange
                          : Colors.transparent,
                    ),
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    competitionsItems[index].league,
                    style: const TextStyle.TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    competitionsItems[index].versus,
                    style: const TextStyle.TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    competitionsItems[index].date +
                        ", " +
                        competitionsItems[index].time,
                    style: const TextStyle.TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          children: [
            Text(
              competitionsItems[index].result,
              style: const TextStyle.TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              competitionsItems[index].pointBevor.toString(),
              style: const TextStyle.TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              competitionsItems[index].pointWinning > 0
                  ? "+" + competitionsItems[index].pointWinning.toString()
                  : competitionsItems[index].pointWinning.toString(),
              style: TextStyle.TextStyle(
                  fontSize: 12,
                  color: competitionsItems[index].pointWinning < 0
                      ? Colors.red
                      : Colors.green),
            ),
          ],
        ),
      ),
      onTap: () {
        if ((_selectedValue == index && _showChart) || !_showChart) {
          Navigator.of(context).pushNamed(ResultPage.routeName);
        } else {
          setState(() {
            _selectedValue = index;
          });
        }
      },
    );
  }
}
