import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// ignore: always_use_package_imports
import '../theme.dart';

String versionName = "Version 1.3.1";

String changeLog = """
𝗥𝗲𝗹𝗼𝗮𝗱 𝗕𝘂𝘁𝘁𝗼𝗻 ( 𝗝𝘂𝘀𝘁 𝗦𝘄𝗶𝗽𝗲 𝗨𝗽 )
I got a lot of complaints of the app suddenly not showing any novels and only working when opened again. I've tried to fix the underlying issues too but as a hotfix, just swipe up to reload your novel data

𝗨𝗽𝗱𝗮𝘁𝗲𝗱 𝗕𝘂𝗴 𝗥𝗲𝗽𝗼𝗿𝘁 𝗟𝗶𝗻𝗸𝘀
The Bug Report and Feature Request Links now don't need you to log in to Github

Also note: we do have Volume support, just click on Volume in "Chapter/Volume Progress"
""";

showChangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        versionName,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      content: Text(
        changeLog,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}
