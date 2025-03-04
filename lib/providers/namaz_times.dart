import 'package:flutter/material.dart';
import '../util/api_util.dart';

class NamazTimes with ChangeNotifier {
  var _namazTimes = {};
  var _masjidList = [];
  var _masjidName = 'Abdullah Bin Masood Masjid';

  void updateData(namazTimes, masjidList, masjidName) {
    _namazTimes = namazTimes;
    _masjidList = masjidList;
    _masjidName = masjidName;
    notifyListeners();
  }

  Future<bool> updateNamazTime(
      String masjidId, String password, String name, String time) async {
    final result =
        await APIUtil.updateNamazTime(masjidId, password, name, time);
    if (result['resultCode'] == 0) {
      _namazTimes[name] = time;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  get namazTimes {
    return _namazTimes;
  }

  get masjidList {
    return _masjidList;
  }

  String get masjidName {
    return _masjidName;
  }

  String get hijriAdjustment {
    return _namazTimes['HIJRI_ADJUSTMENT'];
  }

  bool get isScreenSaverEnabled {
    return namazTimes['SCREEN_SVR_ENABLED'] == 'true' ? true : false;
  }
}
