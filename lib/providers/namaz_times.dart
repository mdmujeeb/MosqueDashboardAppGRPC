import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/grpc/mosque-dashboard.pb.dart';
import 'package:mosque_dashboard_local/util/function_util.dart';
import '../util/grpc_util.dart';

class NamazTimes with ChangeNotifier {
  final _namazTimes = {};
  final GRPCUtil _grpcUtil = GRPCUtil();

  void updateData(GetDataForMobileAppRequest namazTimes) {
    _namazTimes['FAJR'] = FunctionUtil.formatTime(namazTimes.fajrTime);
    _namazTimes['ZUHR'] = FunctionUtil.formatTime(namazTimes.zuhrTime);
    _namazTimes['ASR'] = FunctionUtil.formatTime(namazTimes.asrTime);
    _namazTimes['ISHA'] = FunctionUtil.formatTime(namazTimes.ishaTime);
    _namazTimes['JUMUA'] = FunctionUtil.formatTime(namazTimes.jumuaTime);
    _namazTimes['ISHRAQ'] = FunctionUtil.formatTime(namazTimes.ishraqTime);
    _namazTimes['DUHA'] = FunctionUtil.formatTime(namazTimes.duhaTime);
    _namazTimes['IFTAR'] = FunctionUtil.formatTime(namazTimes.iftarTime);
    _namazTimes['SUHUR'] = FunctionUtil.formatTime(namazTimes.suhurTime);
    _namazTimes['HIJRI_ADJUSTMENT'] = namazTimes.hijriAdjustment.toString();
    _namazTimes['SCREEN_SAVER_SCHEDULE'] =
        '${FunctionUtil.formatTime(namazTimes.screenSaverOnTime)},${FunctionUtil.formatTime(namazTimes.screenSaverOffTime)}';
    _namazTimes['HIJRI_DATE'] = namazTimes.hijriDate;
    _namazTimes['HIJRI_MONTH'] = namazTimes.hijriMonth;
    _namazTimes['HIJRI_YEAR'] = namazTimes.hijriYear;

    notifyListeners();
  }

  Future<bool> updateNamazTime(String masjidId, String password, String name,
      int hour, int minute) async {
    final GenericReply result =
        await _grpcUtil.updateNamazTime(masjidId, password, name, hour, minute);
    if (result.responseCode == 0) {
      NamazTime namazTime = NamazTime.create();
      namazTime.hour = hour;
      namazTime.minute = minute;
      _namazTimes[name] = FunctionUtil.formatTime(namazTime);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  get grpcUtil {
    return _grpcUtil;
  }

  get namazTimes {
    return _namazTimes;
  }

  String get hijriAdjustment {
    return _namazTimes['HIJRI_ADJUSTMENT'];
  }

  bool get isScreenSaverEnabled {
    return namazTimes['SCREEN_SVR_ENABLED'] == 'true' ? true : false;
  }

  // Utility Methods
  Future<bool> testAudio() async {
    final GenericReply result = await _grpcUtil.testAudio();
    if (result.responseCode == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> doZikr(String masjidId, String password) async {
    final GenericReply result =
        await _grpcUtil.updateNamazTime(masjidId, password, "ALLAHU", 20, 30);
    if (result.responseCode == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setScreenSaverState(
      String masjidId, String password, bool state) async {
    final GenericReply result =
        await _grpcUtil.changeScreenSaverState(masjidId, password, state);
    if (result.responseCode == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> restartSystem() async {
    final GenericReply result = await _grpcUtil.restartSystem();
    if (result.responseCode == 0) {
      return true;
    } else {
      return false;
    }
  }
}
