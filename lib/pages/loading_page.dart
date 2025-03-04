import 'package:flutter/material.dart';
import '../util/provider_util.dart';

import 'home_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProviderUtil.loadAllProviders(context),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? MMScaffold(const CircularProgressIndicator()).widget()
              : snapshot.data == true
                  ? HomePage()
                  : MMScaffold(
                      const Text(
                        'An error has Occured. Please make sure that you are connected to Mosque Dashboard WiFi.',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ).widget(),
    );
  }
}

class MMScaffold {
  final Widget _child;

  MMScaffold(this._child);

  Widget widget() {
    return Scaffold(
        appBar: AppBar(title: const Text('Mosque Dashboard')),
        body: Center(child: _child));
  }
}
