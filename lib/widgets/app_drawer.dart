import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../pages/login_page.dart';
import '../pages/about_page.dart';

class MainDrawer extends StatelessWidget {
  final Function _refreshPageState;

  const MainDrawer(this._refreshPageState, {super.key});

  Future<void> _doLoginLogout(ctx, isLogin) async {
    if (isLogin) {
      var navigator = Navigator.of(ctx);
      navigator.pop();
      navigator.pushNamed(LoginPage.ROUTE_NAME).then((result) async {
        if (result != null) {
          await _refreshPageState();
        }
      });
    } else {
      await Provider.of<Auth>(ctx, listen: false).logout();
      Navigator.of(ctx).pop();
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        content: Text('Logged out Successfully'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    bool isAndroidOrWeb = true;

    try {
      if (Platform.isAndroid) {
        isAndroidOrWeb = true;
      } else {
        isAndroidOrWeb = false;
      }
    } catch (e) {
      isAndroidOrWeb = true;
    }

    // final currentMasjidIndex = int.parse(auth.masjidId) - 1;
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          height: 130,
          padding: const EdgeInsets.all(8),
          child: SafeArea(
            child: Text(
              'Mosque Dashboard',
              style: TextStyle(
                fontSize: isAndroidOrWeb ? 20 : 18,
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ListTile(
        //   leading: const Icon(Icons.account_balance),
        //   title: const Text('Choose Masjid'),
        //   onTap: () {
        //     showModalBottomSheet(
        //       context: context,
        //       builder: (context) => StringPicker(
        //           Provider.of<NamazTimes>(context).masjidList,
        //           currentMasjidIndex),
        //     ).then((index) async {
        //       if (index == null || index == currentMasjidIndex) {
        //         return;
        //       }
        //       bool result = await FunctionUtil.onMasjidChosen(context, index);
        //       if (result) {
        //         _refreshPageState();
        //       }
        //     }).then((_) => Navigator.of(context).pop());
        //   },
        // ),
        // const Divider(),
        ListTile(
          leading: auth.isLoggedIn
              ? const Icon(Icons.logout)
              : const Icon(Icons.login),
          title: auth.isLoggedIn ? const Text('Logout') : const Text('Login'),
          onTap: () => _doLoginLogout(context, !auth.isLoggedIn),
        ),
        const Divider(),
        ListTile(
          leading: const Hero(
              tag: 'about-mosque-dashboard', child: Icon(Icons.celebration)),
          title: const Text('About Mosque Dashboard'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AboutPage.routeName);
          },
        ),
        const Divider(),
      ],
    );
  }
}
