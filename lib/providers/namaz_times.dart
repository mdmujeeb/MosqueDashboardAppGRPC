import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/grpc/mosque-dashboard.pb.dart';
import '../util/grpc_util.dart';

class NamazTimes with ChangeNotifier {
  final _namazTimes = {};
  final GRPCUtil _grpcUtil = GRPCUtil();

  void updateData(GetDataForMobileAppRequest namazTimes) {
    _namazTimes['FAJR'] =
        '${namazTimes.fajrTime.hour.toString()}:${namazTimes.fajrTime.minute.toString()}';
    _namazTimes['ZUHR'] =
        '${namazTimes.zuhrTime.hour.toString()}:${namazTimes.zuhrTime.minute.toString()}';
    _namazTimes['ASR'] =
        '${namazTimes.asrTime.hour.toString()}:${namazTimes.asrTime.minute.toString()}';
    _namazTimes['ISHA'] =
        '${namazTimes.ishaTime.hour.toString()}:${namazTimes.ishaTime.minute.toString()}';
    _namazTimes['JUMUA'] =
        '${namazTimes.jumuaTime.hour.toString()}:${namazTimes.jumuaTime.minute.toString()}';
    _namazTimes['JUMUA'] =
        '${namazTimes.jumuaTime.hour.toString()}:${namazTimes.jumuaTime.minute.toString()}';
    _namazTimes['HIJRI_ADJUSTMENT'] = namazTimes.hijriAdjustment.toString();
    _namazTimes['SCREEN_SAVER_SCHEDULE'] =
        '${namazTimes.screenSaverOnTime.hour.toString()}:${namazTimes.screenSaverOnTime.minute.toString()},${namazTimes.screenSaverOffTime.hour.toString()}:${namazTimes.screenSaverOffTime.minute.toString()}';
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
      _namazTimes[name] = '${hour.toString()}:${minute.toString()}';
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
}
