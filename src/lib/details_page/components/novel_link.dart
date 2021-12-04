import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

// ignore: always_use_package_imports
import 'novel_data.dart';

// ignore: use_key_in_widget_constructors
class NovelLink extends StatelessWidget {
  final String link = NovelData.novel.novelLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Link to Novel',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 16,
                color: textColor.withOpacity(0.7),
              ),
              splashRadius: 12,
              onPressed: () => showLinkInfo(context),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: TextEditingController()..text = link,
            style: TextStyle(color: textColor, fontSize: 16),
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(5),
            ),
            onChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.novelLink = text;
            },
          ),
        )
      ],
    );
  }
}

String linkInfo = """
Dynamic Links are also supported. A lot of novel websites use a simple

name.com/novel/chapterNum

format. So you can simply replace the chapterNum part with <num> or <num-d> to pad with zero's and the app automatically updates the link from your chapter Count

Example:
https://boxnovel.com/novel/super-gene-boxnovel/chapter-<num>/

becomes

https://boxnovel.com/novel/super-gene-boxnovel/chapter-3460/

if your chapter progress is 3460""";

showLinkInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        linkInfo,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
      scrollable: true,
    ),
  );
}
