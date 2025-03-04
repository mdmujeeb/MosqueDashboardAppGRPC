import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/login_page.dart';
import '../providers/auth.dart';
import '../providers/namaz_times.dart';
import '../widgets/string_picker.dart';
import '../providers/hijri_date.dart';
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
    final auth = Provider.of<Auth>(context);
    final NamazTimes namazTimes = Provider.of<NamazTimes>(context);
    final currentIndex = HijriDate.ADJUSTMENT_LIST
        .indexOf(namazTimes.namazTimes['HIJRI_ADJUSTMENT']);

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
                          StringPicker(HijriDate.ADJUSTMENT_LIST, currentIndex),
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
                        final result = await namazTimes.updateNamazTime(
                            auth.masjidId,
                            auth.password,
                            'HIJRI_ADJUSTMENT',
                            HijriDate.ADJUSTMENT_LIST[index]);
                        if (result) {
                          FunctionUtil.showSnackBar(
                              context, 'Updated successfully.', Colors.green);
                          await Provider.of<HijriDate>(context, listen: false)
                              .fetchAndSetData(auth.masjidId);
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
