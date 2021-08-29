import 'package:Junior/homepage/body.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Junior',
      theme: new ThemeData(
        primaryColor: backgroundColor,
        accentColor: Colors.white,
      ),
      home: new HomePage(),
    );
  }
}
