import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class FunctionUtil {
  static Future<bool> onMasjidChosen(BuildContext context, int index) async {
    return await Provider.of<Auth>(context, listen: false)
        .chooseMasjid((index + 1).toString());
  }

  static void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  static void showErrorSnackBar(BuildContext context) {
    showSnackBar(context, 'Something went wrong!', Colors.red);
  }
}
