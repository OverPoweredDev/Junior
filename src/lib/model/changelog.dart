import 'package:flutter/material.dart';

import '../theme.dart';

showChangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        'Version 1.2.3',
        style: TextStyle(color: textColor),
      ),
      content: Text(
        'The previous update caused a lot of savefiles in Downloads. A fix for now is storing it all in a dedicated folder',
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}
