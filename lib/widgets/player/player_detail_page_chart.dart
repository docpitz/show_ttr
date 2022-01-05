import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:show_ttr/models/Competition.dart';
import 'package:show_ttr/widgets/player/player_detail_page.dart';
import 'package:show_ttr/widgets/util/flcahrt_double_tap_helper.dart';

class PlayerDetailPageChart {

  final PlayerDetailStateModel _stateModel;
  late List<FlSpot> _mappedItems;
  final FlChartDoubleTapHelper _chartDoubleTapHelper = FlChartDoubleTapHelper();

  PlayerDetailPageChart(this._stateModel) {
    final competitionsItemsChart = List.from(_stateModel.competitionsItems);

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


  Widget buildTTRChart(BuildContext context, State state) {
    List<int> showIndexes =
    _stateModel.selectedValue >= 0 ? [_mappedItems.length - 1 - _stateModel.selectedValue] : [];

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
        lineTouchData: LineTouchData(
          handleBuiltInTouches: _stateModel.selectedValue == -1,
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
                  const TextStyle(fontSize: 11, color: Colors.white),
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
            _chartDoubleTapHelper.doubleTapEvent(event, () {
              state.setState(() {
                _stateModel.maxChart = !_stateModel.maxChart;
              });
            });
            if (touchResponse == null || touchResponse.lineBarSpots == null) {
              return;
            }
            final touchedIndex = touchResponse.lineBarSpots!.first.spotIndex;
            state.setState(() {
              if (event is FlTapDownEvent ||
                  event is FlPanDownEvent ||
                  event is FlLongPressMoveUpdate ||
                  event is FlPanUpdateEvent) {
                _stateModel.selectedValue = _mappedItems.length - 1 - touchedIndex.toInt();
                _stateModel.shouldScrollTo = true;
              }
              if (event is FlTapUpEvent ||
                  event is FlLongPressEnd ||
                  event is FlPanEndEvent ||
                  event is FlPointerExitEvent) {
                _stateModel.shouldScrollTo = false;
              }
            });
          },
        ),
        gridData: _gridData,
        titlesData: _titlesData,
        borderData: _borderData,
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

  FlTitlesData get _titlesData => FlTitlesData(
    bottomTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(showTitles: false, reservedSize: 10),
    topTitles: SideTitles(showTitles: false),
    leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 23,
        margin: 5,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.grey,
          fontSize: 9,
        ),
        getTitles: (value) {
          return value.toInt().toString();
        }),
  );

  FlGridData get _gridData => FlGridData(
    show: true,
    drawVerticalLine: false,
  );

  FlBorderData get _borderData => FlBorderData(
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

}