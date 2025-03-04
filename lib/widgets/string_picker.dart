import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StringPicker extends StatefulWidget {
  final _items;
  final int _initialIndex;

  StringPicker(this._items, this._initialIndex);

  @override
  _StringPickerState createState() => _StringPickerState();
}

class _StringPickerState extends State<StringPicker> {
  int _index = 0;
  var _controller;
  bool isAndroidOrWeb = true;

  @override
  void initState() {
    super.initState();
    _index = widget._initialIndex;
    _controller =
        FixedExtentScrollController(initialItem: widget._initialIndex);

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
            child: CupertinoPicker(
              scrollController: _controller,
              onSelectedItemChanged: (index) => _index = index,
              itemExtent: 30,
              children: [
                ...widget._items.map((string) => Text(string)).toList(),
              ],
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
            onPressed: () => Navigator.of(context).pop(_index),
          ),
        ],
      ),
    );
  }
}
