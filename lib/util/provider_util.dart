import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/grpc/mosque-dashboard.pb.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/namaz_times.dart';
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
      final GetDataForMobileAppRequest result =
          await Provider.of<NamazTimes>(context, listen: false)
              .grpcUtil
              .getDataForMobileApp();

      Provider.of<NamazTimes>(context, listen: false).updateData(result);
      return true;
    } catch (error) {
      FunctionUtil.showErrorSnackBar(context);
      return false;
    }
  }
}
