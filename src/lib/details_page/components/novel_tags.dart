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
              hintText: ' CN, JP, Xianxia, etc.',
              hintStyle: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            onChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.novelTags = text.split(',');
            },
          ),
        )
      ],
    );
  }
}
