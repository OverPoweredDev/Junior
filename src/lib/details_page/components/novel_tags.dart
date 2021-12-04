import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

// ignore: always_use_package_imports
import 'novel_data.dart';

// ignore: use_key_in_widget_constructors
class NovelTags extends StatelessWidget {
  final List tags = NovelData.novel.novelTags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Novel Tags / Reading Lists',
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
            controller: TextEditingController()..text = tags.join(', '),
            style: TextStyle(color: textColor, fontSize: 16),
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(5),
              hintText: ' CN, JP, EN, Xianxia, etc.',
              hintStyle: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            onChanged: (String text) {
              NovelData.isChanged = true;
              text = text.replaceAll(RegExp(r',[ ]*'), ',');
              NovelData.novel.novelTags = text.split(',');
            },
          ),
        )
      ],
    );
  }
}

String linkInfo = """
All Tags now also work as reading lists and will show up at the top of the homescreen if enabled in Settings.Novels having a similar tag are treated as being in the same list

Basically, all the tags you enter double as Reading Lists.""";

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
