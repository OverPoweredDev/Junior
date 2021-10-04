import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import '../theme.dart';

showChangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        'Version 1.2.4',
        style: TextStyle(color: textColor),
      ),
      content: Text(
        'Along with it\'s dedicated folder, AutoSaves are now only saved once a day',
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}
