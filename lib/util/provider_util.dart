import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/namaz_times.dart';
import '../providers/hijri_date.dart';
import '../providers/temperature.dart';
import '../providers/occasions.dart';
import '../util/api_util.dart';
import '../util/function_util.dart';

class ProviderUtil {
  static Future<bool> loadAllProviders(BuildContext context) async {
    final auth = Provider.of<Auth>(context, listen: false);
    try {
      await auth.fetchAndSetData();
    } catch (error) {
      FunctionUtil.showErrorSnackBar(context);
      return false;
    }

    try {
      final result = await APIUtil.getDataForMobileApp(auth.masjidId);
      if (result == null) {
        throw Error();
      }

      Provider.of<NamazTimes>(context, listen: false).updateData(
          result['namazTimes'], result['masjidList'], result['masjidName']);
      Provider.of<Temperature>(context, listen: false)
          .updateData(result['temperature']);
      Provider.of<HijriDate>(context, listen: false)
          .updateData(result['hijriDate']);
      Provider.of<Occasions>(context, listen: false)
          .updateData(result['occasions']);
      return true;
    } catch (error) {
      FunctionUtil.showErrorSnackBar(context);
      return false;
    }
  }
}
