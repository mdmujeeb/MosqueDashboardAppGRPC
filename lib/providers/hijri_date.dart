import 'package:flutter/material.dart';

import '../util/api_util.dart';

class HijriDate with ChangeNotifier {
  static const ADJUSTMENT_LIST = [
    '-4',
    '-3',
    '-2',
    '-1',
    '0',
    '1',
    '2',
    '3',
    '4',
  ];

  String _date = '1';
  String _month = 'Muharram';
  String _year = '1442';

  Future<bool> fetchAndSetData(String masjidId) async {
    final data = await APIUtil.getHijriDate(masjidId);
    if (data == null) {
      return false;
    }
    _date = data['date'];
    _month = data['month'];
    _year = data['year'];
    notifyListeners();
    return true;
  }

  void updateData(data) {
    if (data == null) {
      return;
    }
    _date = data['date'];
    _month = data['month'];
    _year = data['year'];
    notifyListeners();
  }

  String get date {
    return _date;
  }

  String get month {
    return _month;
  }

  String get year {
    return _year;
  }

  String get hijriDate {
    try {
      int.parse(_year);
      return '$_date $_month $_year';
    } catch (error) {
      return '$year';
    }
  }
}
