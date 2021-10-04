import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'Settings',
          style: TextStyle(color: textColor, fontSize: 40),
          textAlign: TextAlign.left,
        ));
  }
}
