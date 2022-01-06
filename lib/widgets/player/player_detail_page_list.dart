import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:show_ttr/widgets/player/player_detail_page.dart';
import 'package:show_ttr/widgets/result/results_page.dart';

class PlayerDetailPageList {
  bool _firstRun = false;
  final ItemScrollController _itemScrollController = ItemScrollController();
  final PlayerDetailStateModel _stateModel;

  PlayerDetailPageList(this._stateModel);

  Widget buildList(BuildContext context, State state) {
    if (_stateModel.selectedValue != -1 && _stateModel.shouldScrollTo && _firstRun) {
      if (_stateModel.maxChart) {
        _itemScrollController.jumpTo(index: _stateModel.selectedValue);
        _stateModel.shouldScrollTo = false;
      } else {
        _itemScrollController
            .scrollTo(
            index: _stateModel.selectedValue,
            duration: const Duration(milliseconds: 150))
            .then((value) => {
          state.setState(() {
            _stateModel.shouldScrollTo = false;
          })
        });
      }
    }

    _firstRun = true;
    return ScrollablePositionedList.separated(
      itemCount: _stateModel.competitionsItems.length,
      itemScrollController: _itemScrollController,
      physics: _stateModel.shouldScrollTo
          ? const ClampingScrollPhysics()
          : const BouncingScrollPhysics(),
      initialScrollIndex: 0,
      itemBuilder: (context, index) {
        return listTile(context, index, state);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  ListTile listTile(BuildContext context, int index, State state) {
    return ListTile(
      title: Row(
        children: [
          Container(
            //duration: const Duration(milliseconds: 5000),
            //curve: Curves.slowMiddle,
            child: !_stateModel.showChart
                ? null
                : Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                width: 3,
                height: 40,
                color: index == _stateModel.selectedValue
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
                    _stateModel.competitionsItems[index].league,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    _stateModel.competitionsItems[index].versus,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    _stateModel.competitionsItems[index].date +
                        ", " +
                        _stateModel.competitionsItems[index].time,
                    style: const TextStyle(fontSize: 12),
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
              _stateModel.competitionsItems[index].result,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              _stateModel.competitionsItems[index].pointBevor.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _stateModel.competitionsItems[index].pointWinning > 0
                  ? "+" + _stateModel.competitionsItems[index].pointWinning.toString()
                  : _stateModel.competitionsItems[index].pointWinning.toString(),
              style: TextStyle(
                  fontSize: 12,
                  color: _stateModel.competitionsItems[index].pointWinning < 0
                      ? Colors.red
                      : Colors.green),
            ),
          ],
        ),
      ),
      onTap: () {
        if ((_stateModel.selectedValue == index && _stateModel.showChart) || !_stateModel.showChart) {
          Navigator.of(context).pushNamed(ResultPage.routeName);
        } else {
          state.setState(() {
            _stateModel.selectedValue = index;
          });
        }
      },
    );
  }
}