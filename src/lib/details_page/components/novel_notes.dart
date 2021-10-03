import 'package:flutter/material.dart';

import '../../theme.dart';
import 'novel_data.dart';

class NovelNotes extends StatelessWidget {
  final String notes = NovelData.novel.notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notes',
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: TextEditingController()..text = notes,
            style: TextStyle(color: textColor, fontSize: 18),
            keyboardType: TextInputType.multiline,
            maxLines: null,
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
              NovelData.novel.notes = text;
            },
          ),
        )
      ],
    );
  }
}
