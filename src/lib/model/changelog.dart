import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import '../theme.dart';

String versionName = "𝗠𝗮𝗷𝗼𝗿 𝗨𝗽𝗱𝗮𝘁𝗲 (𝟭.𝟯.𝟬)";

String changeLog = """
This Young Master has been silent but that's only to break through the bottleneck and reach a whole new realm! Junior has recieved a lot of contributions and nearly a month's worth of effort later, it now supports:

𝗩𝗼𝗹𝘂𝗺𝗲/𝗖𝗵𝗮𝗽𝘁𝗲𝗿 𝗦𝘂𝗽𝗽𝗼𝗿𝘁
Click on the 'Volume' word in the details page for any novel and you'll find support for adding Volumes along with Chapters! This was heavily requested when I'd posted about Junior so I'm glad I could get this out.

𝗡𝗲𝘄 𝗦𝘁𝗮𝘁𝘂𝘀𝗲𝘀
Novels now aren't just Ongoing or Complete. Tap on the status next to your chapter count to cycle it through Ongoing, Complete, To Read and On Hiatus.

𝗡𝗼𝘃𝗲𝗹 𝗧𝗮𝗴𝘀
A change I'm particularly excited about! Novel Tags can be entered as a comma separated list in the Details Page and it'll show up as a proper list of tags on the Novel Tile on your home page. So you can finally mark your Novels by Language, Genre, Website, anything else you want!

𝗜𝗺𝗽𝗿𝗼𝘃𝗲𝗱 𝗦𝗲𝗮𝗿𝗰𝗵
Search doesn't only search by title anymore. Try inputting your notes, your rating, the novel tags or even the link you've given. Works for all of these!


Finally, there are minor updates like showing a small tooltip after updating, etc. but those don't affect your experience. So try out all the new features and be sure to let me know how they feel!
""";

showChangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        versionName,
        style: TextStyle(color: textColor),
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
