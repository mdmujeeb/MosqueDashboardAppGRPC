import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/grpc/mosque-dashboard.pb.dart';
import 'package:mosque_dashboard_local/util/grpc_util.dart';
import 'package:mosque_dashboard_local/util/provider_util.dart';
import 'package:provider/provider.dart';

import '../pages/login_page.dart';
import '../providers/auth.dart';
import '../providers/namaz_times.dart';
import '../widgets/string_picker.dart';
import '../util/function_util.dart';

class HijriAdjustmentWidget extends StatefulWidget {
  final Function _refreshParentPage;

  HijriAdjustmentWidget(this._refreshParentPage);

  @override
  _HijriAdjustmentWidgetState createState() => _HijriAdjustmentWidgetState();
}

class _HijriAdjustmentWidgetState extends State<HijriAdjustmentWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    const adjustmentList = [-5, -4 - 3, -2, -1, 0, 1, 2, 3, 4, 5];
    final auth = Provider.of<Auth>(context);
    final NamazTimes namazTimes = Provider.of<NamazTimes>(context);
    final currentIndex =
        adjustmentList.indexOf(namazTimes.namazTimes['HIJRI_ADJUSTMENT']);

    return Center(
      child: Container(
        width: 300,
        height: 200,
        child: Card(
          elevation: 2,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Chip(
              avatar: Icon(
                Icons.brightness_3_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              label: Text(
                namazTimes.hijriAdjustment,
                style: TextStyle(
                    fontSize:
                        (MediaQuery.of(context).size.width >= 380 ? 20 : 15) /
                            MediaQuery.of(context).textScaleFactor,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 10),
            Text(
              'Current Hijri Adjustment',
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width >= 380 ? 20 : 15) /
                    MediaQuery.of(context).textScaleFactor,
              ),
            ),
            const Divider(),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 4),
                    ),
                    label: const Text(
                      'Change',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.build_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          StringPicker(adjustmentList, currentIndex),
                    ).then((index) async {
                      // Navigator.of(context).pop();
                      if (index == null || index == currentIndex) {
                        return;
                      }
                      if (!auth.isLoggedIn) {
                        Navigator.of(context).pushNamed(LoginPage.ROUTE_NAME);
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        final GenericReply result =
                            await GRPCUtil.updateHijriAdjustment(auth.masjidId,
                                auth.password, adjustmentList[index]);
                        if (result.responseCode == 0) {
                          FunctionUtil.showSnackBar(
                              context, 'Updated successfully.', Colors.green);
                          ProviderUtil.loadAllProviders(context);
                          widget._refreshParentPage();
                        } else {
                          FunctionUtil.showSnackBar(
                              context, 'Failed to Update.', Colors.red);
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }),
                  ),
            const Divider(),
          ]),
        ),
      ),
    );
  }
}
