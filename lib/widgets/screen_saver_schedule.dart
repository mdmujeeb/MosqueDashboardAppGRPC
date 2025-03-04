import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/login_page.dart';
import '../providers/auth.dart';
import '../providers/namaz_times.dart';
import '../util/function_util.dart';
import '../widgets/time_picker.dart';

class ScreenSaverSchedule extends StatefulWidget {
  @override
  _ScreenSaverScheduleState createState() => _ScreenSaverScheduleState();
}

class _ScreenSaverScheduleState extends State<ScreenSaverSchedule> {
  bool _isLoadingStartTime = false;
  bool _isLoadingEndTime = false;

  void _pickTime(BuildContext context, bool isStartTime, String startTime,
      String endTime) async {
    var values = isStartTime ? startTime.split(':') : endTime.split(':');
    int hours = int.parse(values[0]);
    int minutes = int.parse(values[1]);
    showModalBottomSheet(
      context: context,
      builder: (context) => TimePicker(hours, minutes),
    ).then((duration) async {
      if (duration != null) {
        var newHours = duration.inHours.remainder(60);
        newHours = isStartTime ? newHours + 12 : newHours;
        var newMinutes = duration.inMinutes.remainder(60);
        if (hours == newHours && minutes == newMinutes) {
          return;
        }
        final auth = Provider.of<Auth>(context, listen: false);
        if (!auth.isLoggedIn) {
          Navigator.of(context).pushNamed(LoginPage.ROUTE_NAME);
        } else {
          setState(() {
            isStartTime ? _isLoadingStartTime = true : _isLoadingEndTime = true;
          });
          var strNewMinutes = newMinutes < 10 ? '0$newMinutes' : '$newMinutes';
          String newTime = '$newHours:$strNewMinutes';
          final result = await Provider.of<NamazTimes>(context, listen: false)
              .updateNamazTime(
                  auth.masjidId,
                  auth.password,
                  'SCREEN_SAVER_SCHEDULE',
                  isStartTime ? '$newTime,$endTime' : '$startTime,$newTime');
          if (result) {
            FunctionUtil.showSnackBar(
                context, 'Updated successfully.', Colors.green);
          } else {
            FunctionUtil.showSnackBar(context, 'Failed to Update.', Colors.red);
          }
          setState(() {
            isStartTime
                ? _isLoadingStartTime = false
                : _isLoadingEndTime = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final namazTimes = Provider.of<NamazTimes>(context);
    List<String> times =
        namazTimes.namazTimes['SCREEN_SAVER_SCHEDULE'].split(',');
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    double fontSize =
        (MediaQuery.of(context).size.width >= 380 ? 20 : 15) / textScaleFactor;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Time:',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              const SizedBox(width: 15),
              Chip(
                backgroundColor: Colors.green,
                label: Text(
                  times[0],
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              const SizedBox(width: 15),
              _isLoadingStartTime
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
                      onPressed: () =>
                          _pickTime(context, true, times[0], times[1]),
                    ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'End Time:',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              const SizedBox(width: 15),
              Chip(
                backgroundColor: Colors.green,
                label: Text(
                  times[1],
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              const SizedBox(width: 15),
              _isLoadingEndTime
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
                      onPressed: () =>
                          _pickTime(context, false, times[0], times[1]),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
