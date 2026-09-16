import 'dart:async';

import 'package:flutter/material.dart';

class ClockModel extends ChangeNotifier {
  int _seconds = 0;
  Timer? _timer;

  int get seconds => _seconds;

  ClockModel() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds++;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    debugPrint('ClockModel disposed, time cancelled');
    super.dispose();
  }
}
