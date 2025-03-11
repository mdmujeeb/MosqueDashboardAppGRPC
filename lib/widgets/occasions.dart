import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mosque_dashboard_local/util/provider_util.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/auth.dart';
import '../providers/occasions.dart';
import '../pages/login_page.dart';
import '../widgets/add_occasion.dart';
import '../widgets/custom_alert_dialog.dart';
import '../util/function_util.dart';

class OccasionsWidget extends StatefulWidget {
  final Function _refreshParentPage;

  const OccasionsWidget(this._refreshParentPage, {super.key});

  @override
  _OccasionsWidgetState createState() => _OccasionsWidgetState();
}

class _OccasionsWidgetState extends State<OccasionsWidget> {
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
    final occasions = Provider.of<Occasions>(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: occasions.length,
                      itemBuilder: (ctx, index) => Dismissible(
                        key: ValueKey(occasions.occasions[index]['date']),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (_) => showDialog(
                          context: context,
                          builder: (ctx) => CustomAlertDialog(
                            'Confirm Operation',
                            'Are you sure you want to delete this Occasion?',
                          ),
                        ).then((result) {
                          if (result && !auth.isLoggedIn) {
                            Navigator.of(context)
                                .pushNamed(LoginPage.ROUTE_NAME);
                            return false;
                          } else {
                            return result;
                          }
                        }),
                        onDismissed: (_) async {
                          setState(() {
                            _isLoading = true;
                          });
                          // final result = await occasions.deleteOccasion(
                          //     auth.masjidId,
                          //     auth.password,
                          //     occasions.occasions[index]['id'].toString());
                          const result = 1 == 1;
                          if (result) {
                            FunctionUtil.showSnackBar(
                                context, 'Deleted successfully.', Colors.green);
                            await ProviderUtil.loadAllProviders(context);
                            widget._refreshParentPage();
                          } else {
                            FunctionUtil.showSnackBar(context,
                                'Failed to Delete Occasion.', Colors.red);
                          }
                          setState(() {
                            _isLoading = false;
                          });
                        },
                        background: Container(
                          color: Theme.of(context).colorScheme.error,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.delete,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                        child: ListTile(
                          leading: Chip(
                            label: Text(
                              DateFormat('dd MMM').format(DateTime.parse(
                                  occasions.occasions[index]['date'])),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .textScaler
                                      .scale(
                                          (MediaQuery.of(context).size.width >=
                                                  380
                                              ? 20
                                              : 13)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            occasions.occasions[index]['description'],
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width >=
                                        380
                                    ? null
                                    : 13 /
                                        MediaQuery.of(context).textScaleFactor),
                          ),
                          trailing: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.arrow_left),
                            label: const Text('Swipe to delete'),
                          ),
                        ),
                      ),
                    ),
            ),
            ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.resolveWith((states) => Colors.green),
                  elevation: WidgetStateProperty.resolveWith((states) => 4),
                ),
                label: const Text(
                  'Add Occasion',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.add_circle_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AddOccasion(),
                  ).then((result) async {
                    if (result != null) {
                      if (!auth.isLoggedIn) {
                        Navigator.of(context).pushNamed(LoginPage.ROUTE_NAME);
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        // final response = await occasions.addOccasion(
                        //     auth.masjidId,
                        //     auth.password,
                        //     result['date'],
                        //     result['name']);
                        const response = 1 == 1;
                        if (response) {
                          FunctionUtil.showSnackBar(
                              context, 'Added successfully.', Colors.green);
                          await ProviderUtil.loadAllProviders(context);
                          widget._refreshParentPage();
                        } else {
                          FunctionUtil.showSnackBar(
                              context, 'Failed to Added Occasion.', Colors.red);
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}
