import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        'Novels',
        style: TextStyle(color: textColor, fontSize: 40),
        textAlign: TextAlign.left,
      ),
    );
  }
}
