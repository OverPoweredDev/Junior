import 'package:flutter/material.dart';

import '../theme.dart';

showChangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        '1.2.0 Changelog (READ THIS!!!)',
        style: TextStyle(color: textColor),
      ),
      content: Text(
        'A lot of new stuff with this update, I\'ll go by importance\n\n'
        '𝗘𝘅𝗽𝗼𝗿𝘁𝗶𝗻𝗴/𝗜𝗺𝗽𝗼𝗿𝘁𝗶𝗻𝗴 𝗗𝗮𝘁𝗮 𝗶𝘀 𝘂𝗽\nI\'m going to eventually mess up so please keep your data backed up locally. I know nobody actually remembers this so I\'ve also set automatic exporting up on every novel edit. Please keep this on so you maintain your data no matter what\n\n'
        '𝗧𝗵𝗲 𝗘𝗻𝘁𝗶𝗿𝗲 𝗡𝗲𝘄 𝗦𝗲𝘁𝘁𝗶𝗻𝗴𝘀 𝗣𝗮𝗴𝗲\nCheck it out!\n\n'
        '𝗧𝗼𝗴𝗴𝗹𝗲 𝗟𝗶𝗴𝗵𝘁/𝗗𝗮𝗿𝗸 𝗠𝗼𝗱𝗲\nDark Mode is still default and Light mode kinda sucks but it\'s there now\n\n'
        '𝗔 𝗪𝗵𝗼𝗹𝗲 𝗕𝘂𝗻𝗰𝗵𝗮 𝗨𝗜 𝗨𝗽𝗱𝗮𝘁𝗲𝘀\nMainly in the settings page\n\n'
         'As for where 1.1.0 went, it was too buggy so I had to add patches but I was also adding features so we\'re at 1.2.0 now',
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}
