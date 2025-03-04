import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/login_page.dart';
import '../providers/auth.dart';
import '../providers/namaz_times.dart';
import '../widgets/time_picker.dart';
import '../util/function_util.dart';

class NamazTimesWidget extends StatefulWidget {
  final Function _refreshParentPage;

  NamazTimesWidget(this._refreshParentPage);

  @override
  _NamazTimesWidgetState createState() => _NamazTimesWidgetState();
}

class _NamazTimesWidgetState extends State<NamazTimesWidget> {
  Map<String, bool> _isLoading = {
    'FAJR': false,
    'ZOHOR': false,
    'ASR': false,
    'ISHA': false,
    'JUMA': false,
  };

  void _pickTimeForNamazTime(
      BuildContext context, String name, String value) async {
    var values = value.split(':');
    int hours = int.parse(values[0]);
    int minutes = int.parse(values[1]);
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          TimePicker(name != 'FAJR' ? hours + 12 : hours, minutes),
    ).then((duration) async {
      if (duration != null) {
        var newHours = duration.inHours.remainder(60);
        var newMinutes = duration.inMinutes.remainder(60);
        if (hours == newHours && minutes == newMinutes) {
          return;
        }
        final auth = Provider.of<Auth>(context, listen: false);
        if (!auth.isLoggedIn) {
          Navigator.of(context).pushNamed(LoginPage.ROUTE_NAME);
        } else {
          setState(() {
            _isLoading[name] = true;
          });
          var strNewMinutes = newMinutes < 10 ? '0$newMinutes' : '$newMinutes';
          final result = await Provider.of<NamazTimes>(context, listen: false)
              .updateNamazTime(auth.masjidId, auth.password, name,
                  '$newHours:$strNewMinutes');
          if (result) {
            FunctionUtil.showSnackBar(
                context, 'Updated successfully.', Colors.green);
            widget._refreshParentPage();
          } else {
            FunctionUtil.showSnackBar(context, 'Failed to Update.', Colors.red);
          }
          setState(() {
            _isLoading[name] = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final NamazTimes namazTimes = Provider.of<NamazTimes>(context);
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final double namazTimeSize =
        (MediaQuery.of(context).size.width >= 380 ? 20 : 12) / textScaleFactor;

    return Center(
      child: ListView(
        children: [
          ListTile(
            leading: Chip(
              label: Text(
                namazTimes.namazTimes['FAJR'],
                style: TextStyle(
                    fontSize: namazTimeSize,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              backgroundColor: Colors.green,
            ),
            title: Text(
              'FAJR',
              style: TextStyle(fontSize: namazTimeSize),
            ),
            trailing: _isLoading['FAJR'] == null
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
                    onPressed: () => _pickTimeForNamazTime(
                      context,
                      'FAJR',
                      namazTimes.namazTimes['FAJR'],
                    ),
                  ),
          ),
          const Divider(),
          ListTile(
            leading: Chip(
              label: Text(
                namazTimes.namazTimes['ZOHOR'],
                style: TextStyle(
                    fontSize: namazTimeSize,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              backgroundColor: Colors.green,
            ),
            title: Text(
              'ZOHOR',
              style: TextStyle(fontSize: namazTimeSize),
            ),
            trailing: _isLoading['ZOHOR'] == null
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
                    onPressed: () => _pickTimeForNamazTime(
                      context,
                      'ZOHOR',
                      namazTimes.namazTimes['ZOHOR'],
                    ),
                  ),
          ),
          const Divider(),
          ListTile(
            leading: Chip(
              label: Text(
                namazTimes.namazTimes['ASR'],
                style: TextStyle(
                    fontSize: namazTimeSize,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              backgroundColor: Colors.green,
            ),
            title: Text(
              'ASR',
              style: TextStyle(fontSize: namazTimeSize),
            ),
            trailing: _isLoading['ASR'] == null
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
                    onPressed: () => _pickTimeForNamazTime(
                      context,
                      'ASR',
                      namazTimes.namazTimes['ASR'],
                    ),
                  ),
          ),
          const Divider(),
          ListTile(
            leading: Chip(
              label: Text(
                namazTimes.namazTimes['ISHA'],
                style: TextStyle(
                    fontSize: namazTimeSize,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              backgroundColor: Colors.green,
            ),
            title: Text(
              'ISHA',
              style: TextStyle(fontSize: namazTimeSize),
            ),
            trailing: _isLoading['ISHA'] == null
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
                    onPressed: () => _pickTimeForNamazTime(
                      context,
                      'ISHA',
                      namazTimes.namazTimes['ISHA'],
                    ),
                  ),
          ),
          Divider(),
          ListTile(
            leading: Chip(
              label: Text(
                namazTimes.namazTimes['JUMA'],
                style: TextStyle(
                    fontSize: namazTimeSize,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              backgroundColor: Colors.green,
            ),
            title: Text(
              'JUMA',
              style: TextStyle(fontSize: namazTimeSize),
            ),
            trailing: _isLoading['JUMA'] == null
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
                    onPressed: () => _pickTimeForNamazTime(
                      context,
                      'JUMA',
                      namazTimes.namazTimes['JUMA'],
                    ),
                  ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
