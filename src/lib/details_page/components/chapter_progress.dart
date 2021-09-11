import 'package:Junior/details_page/components/complete_checkbox.dart';
import 'package:Junior/details_page/components/novel_data.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class ChapterProgress extends StatelessWidget {
  final int currChapter = NovelData.novel.currChapter;
  final int totalChapters = NovelData.novel.totalChapters;
  final bool isComplete = NovelData.novel.isComplete;

  ChapterProgress();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chapter Progress',
          style: TextStyle(color:  textColor, fontSize: 16),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('c', style: TextStyle(color:  textColor, fontSize: 16)),
                SizedBox(width: 5),
                ChapterInputField(
                  chapterNum: currChapter.toString(),
                  onTextChanged: (String text) {
                    NovelData.isChanged = true;
                    NovelData.novel.currChapter = int.parse(text);
                  },
                ),
                SizedBox(width: 5),
                Text('/', style: TextStyle(color:  textColor, fontSize: 24)),
                SizedBox(width: 5),
                ChapterInputField(
                  chapterNum: totalChapters.toString(),
                  onTextChanged: (String text) {
                    NovelData.isChanged = true;
                    NovelData.novel.totalChapters = int.parse(text);
                  },
                ),
              ],
            ),
            IsCompleteCheckBox(),
          ],
        ),
      ],
    );
  }
}

class ChapterInputField extends StatelessWidget {
  final Function(String) onTextChanged;
  final String chapterNum;

  ChapterInputField({@required this.onTextChanged, this.chapterNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        controller: TextEditingController()
          ..text = (chapterNum == '0') ? '' : chapterNum,
        style: TextStyle(color: textColor),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(5),
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}
