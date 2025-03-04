import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import '../widgets/app_drawer.dart';
import '../widgets/dashboard.dart';
import '../widgets/namaz_times.dart';
import '../widgets/hijri_adjustment.dart';
import '../widgets/occasions.dart';
import '../widgets/screen_saver_schedule.dart';
// import '../widgets/string_picker.dart';
import '../widgets/tab_item.dart';
import '../util/provider_util.dart';
import '../util/function_util.dart';
// import '../providers/auth.dart';
// import '../providers/namaz_times.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  static Future<dynamic> onMessage(Map<String, dynamic> data) async {
    print(data);
    return true;
  }
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;
  bool _isLoading = false;
  bool isAndroidOrWeb = true;

  var _bodyWidgets = [];

  Future<void> _refreshPageState() async {
    setState(() {
      _isLoading = true;
    });
    try {
      bool result = await ProviderUtil.loadAllProviders(context);
      if (result == false) {
        FunctionUtil.showErrorSnackBar(context);
      }
    } catch (error) {
      FunctionUtil.showErrorSnackBar(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _bodyWidgets = [
      NamazTimesWidget(_refreshPage),
      HijriAdjustmentWidget(_refreshPage),
      OccasionsWidget(_refreshPage),
      ScreenSaverSchedule(),
    ];

    try {
      if (Platform.isAndroid) {
        isAndroidOrWeb = true;
      } else {
        isAndroidOrWeb = false;
      }
    } catch (e) {
      isAndroidOrWeb = true;
    }

    // var messaging = FirebaseMessaging();
    // messaging.requestNotificationPermissions();
    // messaging.configure(
    //   onBackgroundMessage: HomePage.onMessage,
    //   onMessage: HomePage.onMessage,
    //   onLaunch: HomePage.onMessage,
    //   onResume: HomePage.onMessage,
    // );
  }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context, listen: false);
    // final currentMasjidIndex = int.parse(auth.masjidId) - 1;
    // ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mosque Dashboard',
          style: TextStyle(
              fontSize: (isAndroidOrWeb
                      ? (MediaQuery.of(context).size.width >= 380 ? 19 : 15)
                      : 15) /
                  MediaQuery.of(context).textScaleFactor),
        ),
        // actions: [
        //   TextButton.icon(

        //     onPressed: () => showModalBottomSheet(
        //       context: context,
        //       builder: (context) => StringPicker(
        //           Provider.of<NamazTimes>(context).masjidList,
        //           currentMasjidIndex),
        //     ).then((index) async {
        //       if (index == null || index == currentMasjidIndex) {
        //         return;
        //       }
        //       final result = await FunctionUtil.onMasjidChosen(context, index);
        //       if (result) {
        //         await _refreshPageState();
        //       } else {
        //         FunctionUtil.showErrorSnackBar(context);
        //       }
        //     }),
        //     icon: Icon(
        //       Icons.account_balance,
        //       size: isAndroidOrWeb
        //           ? (MediaQuery.of(context).size.width >= 380 ? null : 15)
        //           : 15 / MediaQuery.of(context).textScaleFactor,
        //     ),
        //     label: Text(
        //       'Choose Masjid',
        //       style: TextStyle(
        //           fontSize: isAndroidOrWeb
        //               ? (MediaQuery.of(context).size.width >= 380 ? null : 10)
        //               : 10 / MediaQuery.of(context).textScaleFactor),
        //     ),
        //     style: ButtonStyle(
        //       foregroundColor: MaterialStateProperty.resolveWith<Color>(
        //         (Set<MaterialState> states) {
        //           return theme.accentTextTheme.headline1.color;
        //         },
        //       ),
        //     ),
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: MainDrawer(_refreshPageState),
      ),
      body: _isLoading
          ? Center(child: const CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height - 135,
                child: Column(
                  children: [
                    Dashboard(),
                    Expanded(child: _bodyWidgets[_currentTabIndex]),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: SingleChildScrollView(
        child: Card(
          elevation: 0,
          child: Padding(
            padding: isAndroidOrWeb
                ? EdgeInsets.symmetric(horizontal: 2, vertical: 4)
                : EdgeInsets.only(
                    left: 2,
                    right: 2,
                    top: 4,
                    bottom: 25,
                  ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabItem(
                    'Namaz Times',
                    Icons.access_time,
                    _currentTabIndex == 0,
                    () => setState(() {
                      _currentTabIndex = 0;
                    }),
                  ),
                  TabItem(
                    'Hijri Adjustment',
                    Icons.brightness_4,
                    _currentTabIndex == 1,
                    () => setState(() {
                      _currentTabIndex = 1;
                    }),
                  ),
                  TabItem(
                    'Occasions',
                    Icons.calendar_today,
                    _currentTabIndex == 2,
                    () => setState(() {
                      _currentTabIndex = 2;
                    }),
                  ),
                  TabItem(
                    'Screen Saver',
                    Icons.monitor,
                    _currentTabIndex == 3,
                    () => setState(() {
                      _currentTabIndex = 3;
                    }),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
