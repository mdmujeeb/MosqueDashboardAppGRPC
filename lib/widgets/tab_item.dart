import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String _text;
  final IconData? _icon;
  final bool _isSelected;
  final GestureTapCallback? _onTap;

  const TabItem(this._text, this._icon, this._isSelected, this._onTap,
      {super.key});

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
                : MediaQuery.of(context).textScaler.scale(20),
          ),
          Text(
            _text,
            style: TextStyle(
              color: _isSelected ? theme.primaryColor : Colors.grey,
              fontSize: MediaQuery.of(context).size.width >= 380
                  ? null
                  : MediaQuery.of(context).textScaler.scale(12),
            ),
          ),
        ],
      ),
    );
  }
}
