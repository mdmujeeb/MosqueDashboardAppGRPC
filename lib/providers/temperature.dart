import 'package:flutter/material.dart';

class Temperature with ChangeNotifier {
  String _temperature = '21';
  String _color = 'cyan';

  void updateData(data) {
    if (data == null) {
      return;
    }
    _temperature = data['tempreature'];
    _color = data['color'];
    notifyListeners();
  }

  String get temperature {
    return _temperature;
  }

  String get color {
    return _color;
  }
}
