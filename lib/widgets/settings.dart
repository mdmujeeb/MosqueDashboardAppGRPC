import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/providers/namaz_times.dart';
import 'package:mosque_dashboard_local/util/provider_util.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/auth.dart';
import '../providers/occasions.dart';
import '../pages/login_page.dart';
import '../widgets/add_occasion.dart';
import '../widgets/custom_alert_dialog.dart';
import '../util/function_util.dart';

class SettingsWidget extends StatefulWidget {
  final Function _refreshParentPage;

  const SettingsWidget(this._refreshParentPage, {super.key});

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _isLoading = false;
  bool isAndroidOrWeb = true;

  @override
  void initState() {
    super.initState();
    try {
      if (Platform.isAndroid) {
        isAndroidOrWeb = true;
      } else {
        isAndroidOrWeb = false;
      }
    } catch (e) {
      isAndroidOrWeb = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final namazTimes = Provider.of<NamazTimes>(context, listen: false);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                              (states) => Colors.green),
                          elevation:
                              WidgetStateProperty.resolveWith((states) => 4),
                        ),
                        label: const Text(
                          'Do Zikr',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (!auth.isLoggedIn) {
                            Navigator.of(context)
                                .pushNamed(LoginPage.ROUTE_NAME);
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            final response = await namazTimes.doZikr(
                                auth.masjidId, auth.password);
                            if (response) {
                              FunctionUtil.showSnackBar(context,
                                  'Operation Successful.', Colors.green);
                              await ProviderUtil.loadAllProviders(context);
                              widget._refreshParentPage();
                            } else {
                              FunctionUtil.showSnackBar(
                                  context, 'Operation Failed.', Colors.red);
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                              (states) => Colors.green),
                          elevation:
                              WidgetStateProperty.resolveWith((states) => 4),
                        ),
                        label: const Text(
                          'Test Audio',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (!auth.isLoggedIn) {
                            Navigator.of(context)
                                .pushNamed(LoginPage.ROUTE_NAME);
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            final response = await namazTimes.testAudio();
                            if (response) {
                              FunctionUtil.showSnackBar(context,
                                  'Operation Successful.', Colors.green);
                              await ProviderUtil.loadAllProviders(context);
                              widget._refreshParentPage();
                            } else {
                              FunctionUtil.showSnackBar(
                                  context, 'Operation Failed.', Colors.red);
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                              (states) => Colors.green),
                          elevation:
                              WidgetStateProperty.resolveWith((states) => 4),
                        ),
                        label: const Text(
                          'Screen Saver On',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (!auth.isLoggedIn) {
                            Navigator.of(context)
                                .pushNamed(LoginPage.ROUTE_NAME);
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            final response =
                                await namazTimes.setScreenSaverState(
                                    auth.masjidId, auth.password, true);
                            if (response) {
                              FunctionUtil.showSnackBar(context,
                                  'Operation Successful.', Colors.green);
                              await ProviderUtil.loadAllProviders(context);
                              widget._refreshParentPage();
                            } else {
                              FunctionUtil.showSnackBar(
                                  context, 'Operation Failed.', Colors.red);
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                              (states) => Colors.green),
                          elevation:
                              WidgetStateProperty.resolveWith((states) => 4),
                        ),
                        label: const Text(
                          'Screen Saver Off',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (!auth.isLoggedIn) {
                            Navigator.of(context)
                                .pushNamed(LoginPage.ROUTE_NAME);
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            final response =
                                await namazTimes.setScreenSaverState(
                                    auth.masjidId, auth.password, false);
                            if (response) {
                              FunctionUtil.showSnackBar(context,
                                  'Operation Successful.', Colors.green);
                              await ProviderUtil.loadAllProviders(context);
                              widget._refreshParentPage();
                            } else {
                              FunctionUtil.showSnackBar(
                                  context, 'Operation Failed.', Colors.red);
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                              (states) => Colors.green),
                          elevation:
                              WidgetStateProperty.resolveWith((states) => 4),
                        ),
                        label: const Text(
                          'Restart System',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (!auth.isLoggedIn) {
                            Navigator.of(context)
                                .pushNamed(LoginPage.ROUTE_NAME);
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            final response = await namazTimes.restartSystem();
                            if (response) {
                              FunctionUtil.showSnackBar(context,
                                  'Operation Successful.', Colors.green);
                              await ProviderUtil.loadAllProviders(context);
                              widget._refreshParentPage();
                            } else {
                              FunctionUtil.showSnackBar(
                                  context, 'Operation Failed.', Colors.red);
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
