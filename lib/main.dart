import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/about_page.dart';

import 'providers/auth.dart';
import 'providers/namaz_times.dart';
import 'providers/hijri_date.dart';
import 'providers/temperature.dart';
import 'providers/occasions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(MosqueDashboardApp()));
}

class MosqueDashboardApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (_) => Auth()),
        ChangeNotifierProvider<NamazTimes>(create: (_) => NamazTimes()),
        ChangeNotifierProvider<HijriDate>(create: (_) => HijriDate()),
        ChangeNotifierProvider<Occasions>(create: (_) => Occasions()),
        ChangeNotifierProvider<Temperature>(create: (_) => Temperature()),
      ],
      child: MaterialApp(
        title: 'Mosque Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.brown),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (ctx) => LoadingPage(),
          LoginPage.ROUTE_NAME: (ctx) => LoginPage(),
          AboutPage.ROUTE_NAME: (ctx) => AboutPage(),
        },
      ),
    );
  }
}
