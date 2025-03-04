import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final int _initialHours;
  final int _initialMinutes;

  TimePicker(this._initialHours, this._initialMinutes);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int _hours = 0;
  int _minutes = 0;
  bool isAndroidOrWeb = true;

  @override
  void initState() {
    super.initState();
    _hours = widget._initialHours > 12
        ? widget._initialHours - 12
        : widget._initialHours;
    _minutes = widget._initialMinutes;
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
    return Padding(
      padding: EdgeInsets.only(bottom: isAndroidOrWeb ? 0 : 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime(
                  1969, 1, 1, widget._initialHours, widget._initialMinutes),
              onDateTimeChanged: (DateTime newDateTime) {
                var newTod = TimeOfDay.fromDateTime(newDateTime);
                _hours = newTod.hour > 12 ? newTod.hour - 12 : newTod.hour;
                _minutes = newTod.minute;
              },
              use24hFormat: false,
              minuteInterval: 1,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).primaryColor),
              elevation: MaterialStateProperty.resolveWith((states) => 4),
            ),
            child: Text(
              'OK',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: () async {
              Navigator.of(context)
                  .pop(Duration(hours: _hours, minutes: _minutes));
            },
          ),
        ],
      ),
    );
  }
}
