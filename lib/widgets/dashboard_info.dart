import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/namaz_times.dart';
import '../providers/temperature.dart';
import '../providers/hijri_date.dart';

class DashboardInfo extends StatefulWidget {
  static const Color NAFIL_NAMAZ_TIME_COLOR = Colors.black38;
  static const Color NAMAZ_TIME_COLOR = Colors.black;
  static const Color NAMAZ_TIME_VALUE_COLOR = Colors.green;
  static final Color? nafilNamazTimeValueColor = Colors.green[700];

  @override
  _DashboardInfoState createState() => _DashboardInfoState();
}

class _DashboardInfoState extends State<DashboardInfo> {
  double namazFontSize = 18;

  Color _parseColor(String color) {
    switch (color) {
      case 'cyan':
        return Colors.cyan;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'red':
        return Colors.red;
      default:
        return Colors.cyan;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    namazFontSize =
        (MediaQuery.of(context).size.width < 380 ? 12 : 18) / textScaleFactor;

    return Consumer<NamazTimes>(
      builder: (ctx, namazTimes, _) => Container(
        // color: Colors.black,
        // padding: const EdgeInsets.all(6),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer<Temperature>(
                        builder: (ctx, temperature, _) => Text(
                          '${temperature.temperature}°c',
                          style: TextStyle(
                            fontSize: 60,
                            color: _parseColor(temperature.color),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Consumer<HijriDate>(
                        builder: (ctx, hijriDate, _) => Container(
                          height: MediaQuery.of(context).size.width >= 470
                              ? 100
                              : 80,
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://192.168.0.1/moonphases/${hijriDate.date}.jpg'),
                            placeholder: AssetImage('assets/images/moon.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DateFormat('dd MMM yyyy').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.width >= 380
                                  ? 20
                                  : 15) /
                              MediaQuery.of(context).textScaleFactor,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Consumer<HijriDate>(
                        builder: (ctx, hijriDate, _) => Text(
                          hijriDate.hijriDate,
                          style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.width >= 380
                                    ? 20
                                    : 15) /
                                MediaQuery.of(context).textScaleFactor,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ISHRAQ:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAFIL_NAMAZ_TIME_COLOR,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ISHRAQ'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.nafilNamazTimeValueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'SEHERI:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAFIL_NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['SEHERI'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.nafilNamazTimeValueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'IFTAR:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAFIL_NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['IFTAR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.nafilNamazTimeValueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            'FAJR:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['FAJR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_VALUE_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ZOHOR:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ZOHOR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_VALUE_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ASR:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ASR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_VALUE_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            'MAGRIB',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['MAGRIB'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_VALUE_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ISHA:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ISHA'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_VALUE_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'JUMA:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_COLOR,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['JUMA'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.NAMAZ_TIME_VALUE_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
