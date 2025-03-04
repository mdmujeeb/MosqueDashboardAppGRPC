import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final _text;
  final _icon;
  final _isSelected;
  final _onTap;

  TabItem(this._text, this._icon, this._isSelected, this._onTap);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: _onTap,
      child: Column(
        children: [
          Icon(
            _icon,
            color: _isSelected ? theme.primaryColor : Colors.grey,
            size: MediaQuery.of(context).size.width >= 380
                ? null
                : 20 / MediaQuery.of(context).textScaleFactor,
          ),
          Text(
            _text,
            style: TextStyle(
              color: _isSelected ? theme.primaryColor : Colors.grey,
              fontSize: MediaQuery.of(context).size.width >= 380
                  ? null
                  : 12 / MediaQuery.of(context).textScaleFactor,
            ),
          ),
        ],
      ),
    );
  }
}
