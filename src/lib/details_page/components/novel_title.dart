import 'package:Junior/details_page/components/novel_data.dart';
import 'package:flutter/material.dart';

class NovelTitle extends StatelessWidget {
  final String title = NovelData.novel.title;
  final bool autoFocus;

  NovelTitle({this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: TextField(
        controller: TextEditingController()..text = title,
        keyboardType: TextInputType.text,
        autofocus: autoFocus,
        maxLines: 3,
        minLines: 1,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(5),
        ),
        style: TextStyle(color: Colors.white, fontSize: 36),
        onChanged: (String text) {
          NovelData.isChanged = true;
          NovelData.novel.title = text;
        },
      ),
    );
  }
}
