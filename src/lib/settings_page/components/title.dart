import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  final Color textColor;
  const SettingsTitle(this.textColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'Settings',
        style: TextStyle(color: textColor, fontSize: 40),
        textAlign: TextAlign.left,
      ),
    );
  }
}
