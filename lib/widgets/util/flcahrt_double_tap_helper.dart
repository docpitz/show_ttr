import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum _DoubleTap { step1, step2, step3, step4, step5, doubleTap }

class FlChartDoubleTapHelper {
  _DoubleTap? _chartDoubleTap;
  int _chartDoubleTapTimeStart = 0;

  void doubleTapEvent(FlTouchEvent event, VoidCallback callback) {
    _calculateDoubleChartTap(event);
    if (_isDoubleTap()) {
      callback();
      _reset();
    }
  }

  void _reset() {
    _chartDoubleTap = null;
    _chartDoubleTapTimeStart = 0;
  }

  bool _isDoubleTap() {
    return _chartDoubleTap == _DoubleTap.doubleTap;
  }

  void _calculateDoubleChartTap(FlTouchEvent event) {
    if ((event is FlPanDownEvent || event is FlTapDownEvent) &&
        _chartDoubleTap == null) {
      _chartDoubleTap = _DoubleTap.step1;
    } else if ((event is FlPanDownEvent || event is FlTapDownEvent) &&
        _chartDoubleTap == _DoubleTap.step1) {
      _chartDoubleTap = _DoubleTap.step5;
    } else if ((event is FlTapDownEvent || event is FlPanDownEvent) &&
        _chartDoubleTap == _DoubleTap.step1) {
      _chartDoubleTap = _DoubleTap.step2;
    } else if (event is FlTapUpEvent && _chartDoubleTap == _DoubleTap.step2) {
      _chartDoubleTap = _DoubleTap.step3;
      _chartDoubleTapTimeStart = DateTime.now().millisecondsSinceEpoch;
    } else if ((event is FlPanDownEvent || event is FlTapDownEvent) &&
        _chartDoubleTap == _DoubleTap.step3) {
      _chartDoubleTap = _DoubleTap.step4;
    } else if ((event is FlTapDownEvent || event is FlPanDownEvent) &&
        _chartDoubleTap == _DoubleTap.step4) {
      _chartDoubleTap = _DoubleTap.step5;
    } else if (event is FlTapUpEvent && _chartDoubleTap == _DoubleTap.step5) {
      if (DateTime.now().millisecondsSinceEpoch <
          _chartDoubleTapTimeStart + 250) {
        _chartDoubleTap = _DoubleTap.doubleTap;
      } else {
        _chartDoubleTap = _DoubleTap.step3;
        _chartDoubleTapTimeStart = DateTime.now().millisecondsSinceEpoch;
      }
    } else if (event is! FlPointerHoverEvent && event is! FlPanCancelEvent) {
      _chartDoubleTap = null;
      _chartDoubleTapTimeStart = 0;
    }
    //print(_chartDoubleTap);
  }
}
