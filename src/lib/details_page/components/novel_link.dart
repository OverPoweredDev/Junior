import 'package:flutter/material.dart';

import '../../theme.dart';
import 'novel_data.dart';

class NovelLink extends StatelessWidget {
  final String link = NovelData.novel.novelLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Link to Novel',
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: TextEditingController()..text = link,
            style: TextStyle(color: textColor, fontSize: 18),
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
