import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/grpc/mosque-dashboard.pb.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/namaz_times.dart';

class DashboardInfo extends StatefulWidget {
  static const Color nafilNamazTimeColor = Colors.black38;
  static const Color namazTimeColor = Colors.black;
  static const Color namazTimeValueColor = Colors.green;
  static final Color? nafilNamazTimeValueColor = Colors.green[700];

  const DashboardInfo({super.key});

  @override
  _DashboardInfoState createState() => _DashboardInfoState();
}

class _DashboardInfoState extends State<DashboardInfo> {
  double namazFontSize = 18;

  // Color _parseColor(String color) {
  //   switch (color) {
  //     case 'cyan':
  //       return Colors.cyan;
  //     case 'yellow':
  //       return Colors.yellow;
  //     case 'orange':
  //       return Colors.orange;
  //     case 'red':
  //       return Colors.red;
  //     default:
  //       return Colors.cyan;
  //   }
  // }

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
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer<NamazTimes>(
                        builder: (ctx, namazTImes, _) => SizedBox(
                          height: MediaQuery.of(context).size.width >= 470
                              ? 100
                              : 80,
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://192.168.0.1/moonphases/${namazTimes.namazTimes['HIJRI_DATE']}.jpg'),
                            placeholder:
                                const AssetImage('assets/images/moon.jpg'),
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
                      Consumer<NamazTime>(
                        builder: (ctx, hijriDate, _) => Text(
                          namazTimes.namazTimes['HIJRI_DATE'],
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
                  // Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // children: [
                  // Row(
                  //   children: [
                  //     Text(
                  //       'ISHRAQ:',
                  //       style: TextStyle(
                  //         fontSize: namazFontSize,
                  //         color: DashboardInfo.nafilNamazTimeColor,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 4),
                  //     Text(
                  //       namazTimes.namazTimes['ISHRAQ'],
                  //       style: TextStyle(
                  //         fontSize: namazFontSize,
                  //         color: DashboardInfo.nafilNamazTimeValueColor,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'SUHUR:',
                  //       style: TextStyle(
                  //         fontSize: namazFontSize,
                  //         color: DashboardInfo.nafilNamazTimeColor,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 4),
                  //     Text(
                  //       namazTimes.namazTimes['SUHUR'],
                  //       style: TextStyle(
                  //         fontSize: namazFontSize,
                  //         color: DashboardInfo.nafilNamazTimeValueColor,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'IFTAR:',
                  //       style: TextStyle(
                  //         fontSize: namazFontSize,
                  //         color: DashboardInfo.nafilNamazTimeColor,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 4),
                  //     Text(
                  //       namazTimes.namazTimes['IFTAR'],
                  //       style: TextStyle(
                  //         fontSize: namazFontSize,
                  //         color: DashboardInfo.nafilNamazTimeValueColor,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // ],
                  // ),
                  // const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            'FAJR:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['FAJR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeValueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ZUHR:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ZUHR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeValueColor,
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
                              color: DashboardInfo.namazTimeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ASR'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeValueColor,
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
                            'MAGHRIB',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['MAGHRIB'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeValueColor,
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
                              color: DashboardInfo.namazTimeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['ISHA'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeValueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'JUMUA:',
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            namazTimes.namazTimes['JUMUA'],
                            style: TextStyle(
                              fontSize: namazFontSize,
                              color: DashboardInfo.namazTimeValueColor,
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
