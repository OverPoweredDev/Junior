import 'package:flutter/material.dart';
import 'package:junior/theme.dart';
// ignore: always_use_package_imports
import 'novel_data.dart';

// ignore: use_key_in_widget_constructors
class NovelTags extends StatelessWidget {
  final String link = NovelData.novel.novelLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Novel Tags',
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: TextEditingController()..text = '',
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
              // NovelData.isChanged = true;
              // NovelData.novel.novelLink = text;
            },
          ),
        )
      ],
    );
  }
}
