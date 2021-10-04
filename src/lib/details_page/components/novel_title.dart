import 'package:junior/details_page/components/novel_data.dart';
import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import '../../theme.dart';

class NovelTitle extends StatelessWidget {
  final String title = NovelData.novel.title;
  final bool autoFocus;

  // ignore: sort_constructors_first
  NovelTitle({Key key, this.autoFocus = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: TextField(
        controller: TextEditingController()..text = title,
        keyboardType: TextInputType.text,
        autofocus: autoFocus,
        maxLines: 3,
        minLines: 1,
        decoration: const InputDecoration(
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(5),
        ),
        style: TextStyle(color: textColor, fontSize: 36),
        onChanged: (String text) {
          NovelData.isChanged = true;
          NovelData.novel.title = text;
        },
      ),
    );
  }
}
