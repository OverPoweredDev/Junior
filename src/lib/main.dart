import 'package:flutter/material.dart';
import 'package:junior/home_page/body.dart';
import 'package:junior/theme.dart';

void main() async {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Junior',
      theme: ThemeData(
        primaryColor: backgroundColor,
        // ignore: deprecated_member_use
        accentColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
