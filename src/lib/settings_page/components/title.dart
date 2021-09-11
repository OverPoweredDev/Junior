import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding( padding: EdgeInsets.symmetric(horizontal: 15), child:
      Text(
      'Settings',
      style: TextStyle(color: textColor, fontSize: 40),
      textAlign: TextAlign.left,
    ));
  }
}
