import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// ignore: always_use_package_imports
import '../theme.dart';

String versionName = "Version 1.4.0";

String changeLog = """
Sorry for the delay folks, Exam season where I live right now. Anyways, big update, this one. We got:

𝗥𝗲𝗮𝗱𝗶𝗻𝗴 𝗟𝗶𝘀𝘁𝘀!!! 
All tags now double as reading lists. So you can group novels together by those if you want to. Detailed explanation (as with the others) in the FAQ's

𝗗𝘆𝗻𝗮𝗺𝗶𝗰 𝗟𝗶𝗻𝗸𝘀
Links are now dynamic! A lot of novel websites use a simple 𝘯𝘢𝘮𝘦.𝘤𝘰𝘮/𝘯𝘰𝘷𝘦𝘭/𝘤𝘩𝘢𝘱𝘵𝘦𝘳𝘕𝘶𝘮 format. So the basic idea is to automatically (dynamically) replace the 𝘤𝘩𝘢𝘱𝘵𝘦𝘳𝘕𝘶𝘮 part with your progress entered. Check the FAQ page for more details.

𝗙𝗔𝗤 𝗣𝗮𝗴𝗲
New FAQ page, down in the settings menu. Check it out! I'd actually love some design input on that, looks kinda plain to me...

𝗡𝗼𝘃𝗲𝗹 𝗘𝘅𝗽𝗼𝗿𝘁 𝗜𝘀𝘀𝘂𝗲
There's an issue with some folks regarding this setting. Check the FAQ page from Settings for that.
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
