import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final _title;
  final _message;

  const CustomAlertDialog(this._title, this._message, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Text(_message),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
