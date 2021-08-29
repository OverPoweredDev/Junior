import 'package:flutter/material.dart';

class HomePageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        'Novels',
        style: TextStyle(color: Colors.white, fontSize: 40),
        textAlign: TextAlign.left,
      ),
    );
  }
}