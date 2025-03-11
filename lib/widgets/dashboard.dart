import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard_info.dart';
import '../providers/auth.dart';
import '../pages/login_page.dart';
import '../util/function_util.dart';
import '../util/grpc_util.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // bool _screenSaverSwitchValue = false;
  bool _isLoadingSetTime = false;
  // bool _isLoadingScreenSaver = false;

  void _submitSetTimeRequest() async {
    final auth = Provider.of<Auth>(context, listen: false);
    // final namazTimes = Provider.of<NamazTimes>(context, listen: false);
    if (!auth.isLoggedIn) {
      Navigator.of(context).pushNamed(LoginPage.ROUTE_NAME);
    } else {
      setState(() {
        _isLoadingSetTime = true;
      });
      await GRPCUtil.setTime(auth.masjidId, auth.password);
      FunctionUtil.showSnackBar(
          context, 'Time Sync request submitted successfully.', Colors.green);

      setState(() {
        _isLoadingSetTime = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var auth = Provider.of<Auth>(context);
    // var namazTimes = Provider.of<NamazTimes>(context);
    // String msg = namazTimes.isScreenSaverEnabled ? 'Turn Off' : 'Turn On';
    // _screenSaverSwitchValue = namazTimes.isScreenSaverEnabled;

    return Container(
      height: 290,
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Expanded(child: DashboardInfo()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLoadingSetTime
                    ? const Padding(
                        padding: const EdgeInsets.all(10),
                        child: const CircularProgressIndicator())
                    : TextButton.icon(
                        onPressed: _submitSetTimeRequest,
                        icon: const Icon(Icons.autorenew),
                        label: Text(
                          'Sync Time',
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width >= 380
                                  ? null
                                  : 12 /
                                      MediaQuery.of(context).textScaleFactor),
                        ),
                      ),
                // _isLoadingScreenSaver
                //     ? const Padding(
                //         padding: const EdgeInsets.all(10),
                //         child: const CircularProgressIndicator())
                //     : CupertinoSwitch(
                //         value: _screenSaverSwitchValue,
                //         onChanged: (value) {
                //           showDialog(
                //             context: context,
                //             builder: (ctx) => CustomAlertDialog(
                //               'Confirm Operation',
                //               'Are you sure you want to $msg Scren Saver?',
                //             ),
                //           ).then((result) async {
                //             if (result) {
                //               if (!auth.isLoggedIn) {
                //                 Navigator.of(context)
                //                     .pushNamed(LoginPage.ROUTE_NAME);
                //                 return;
                //               } else {
                //                 setState(() {
                //                   _isLoadingScreenSaver = true;
                //                 });
                //                 bool result = await namazTimes.updateNamazTime(
                //                   auth.masjidId,
                //                   auth.password,
                //                   'SCREEN_SVR_ENABLED',
                //                   value ? 'true' : 'false',
                //                 );
                //                 if (result) {
                //                   FunctionUtil.showSnackBar(
                //                       context,
                //                       'Screen saver ${value ? "turned on" : "turned off"} successfully.',
                //                       Colors.green);
                //                   setState(() {
                //                     _screenSaverSwitchValue = value;
                //                   });
                //                 } else {
                //                   FunctionUtil.showSnackBar(
                //                       context,
                //                       'Unable to ${value ? "turned on" : "turned off"} Screen saver.',
                //                       Colors.red);
                //                 }
                //                 setState(() {
                //                   _isLoadingScreenSaver = false;
                //                 });
                //               }
                //             }
                //           });
                //         }),
                // Text(
                //   'Screen Saver',
                //   style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.width >= 380
                //           ? null
                //           : 12 / MediaQuery.of(context).textScaleFactor),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
