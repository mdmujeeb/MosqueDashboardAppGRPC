import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/auth.dart';
import '../providers/occasions.dart';
import '../providers/hijri_date.dart';
import '../pages/login_page.dart';
import '../widgets/add_occasion.dart';
import '../widgets/custom_alert_dialog.dart';
import '../util/function_util.dart';

class OccasionsWidget extends StatefulWidget {
  final Function _refreshParentPage;

  OccasionsWidget(this._refreshParentPage);

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
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _isLoading
                  ? const Center(child: const CircularProgressIndicator())
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
                          final result = await occasions.deleteOccasion(
                              auth.masjidId,
                              auth.password,
                              occasions.occasions[index]['id'].toString());
                          if (result) {
                            FunctionUtil.showSnackBar(
                                context, 'Deleted successfully.', Colors.green);
                            await Provider.of<HijriDate>(context, listen: false)
                                .fetchAndSetData(auth.masjidId);
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
                          color: Theme.of(context).errorColor,
                          child: Icon(Icons.delete,
                              color: Theme.of(context).colorScheme.onSecondary),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(10),
                        ),
                        child: ListTile(
                          leading: Chip(
                            label: Text(
                              DateFormat('dd MMM').format(DateTime.parse(
                                  occasions.occasions[index]['date'])),
                              style: TextStyle(
                                  fontSize:
                                      (MediaQuery.of(context).size.width >= 380
                                              ? 20
                                              : 13) /
                                          MediaQuery.of(context)
                                              .textScaleFactor,
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
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green),
                  elevation: MaterialStateProperty.resolveWith((states) => 4),
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
                        final response = await occasions.addOccasion(
                            auth.masjidId,
                            auth.password,
                            result['date'],
                            result['name']);
                        if (response) {
                          FunctionUtil.showSnackBar(
                              context, 'Added successfully.', Colors.green);
                          await Provider.of<HijriDate>(context, listen: false)
                              .fetchAndSetData(auth.masjidId);
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
