import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOccasion extends StatefulWidget {
  const AddOccasion({super.key});

  @override
  _AddOccasionState createState() => _AddOccasionState();
}

class _AddOccasionState extends State<AddOccasion> {
  DateTime _date = DateTime.now();
  String _name = '';
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
    return Padding(
      padding: EdgeInsets.only(bottom: isAndroidOrWeb ? 0 : 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Occasion Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Name of the Occasion';
              } else {
                return null;
              }
            },
            onChanged: (value) => _name = value,
            onFieldSubmitted: (value) => _name = value,
            onSaved: (value) => _name = value.toString(),
            autovalidateMode: AutovalidateMode.always,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: CupertinoDatePicker(
              onDateTimeChanged: (date) {
                _date = date;
              },
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                  (states) => Theme.of(context).primaryColor),
              elevation: WidgetStateProperty.resolveWith((states) => 4),
            ),
            child: Text(
              'OK',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: () {
              Navigator.of(context).pop({'name': _name, 'date': _date});
            },
          ),
        ],
      ),
    );
  }
}
