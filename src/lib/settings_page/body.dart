import 'package:Junior/homepage/body.dart';
import 'package:Junior/settings_page/components/settings_list.dart';
import 'package:Junior/settings_page/components/title.dart';
import 'package:Junior/theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 80, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsTitle(),
                SizedBox(height: 60),
                Settings(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
