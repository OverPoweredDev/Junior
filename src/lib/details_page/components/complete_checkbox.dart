import 'package:Junior/details_page/components/novel_data.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class IsCompleteCheckBox extends StatefulWidget {
  @override
  _IsCompleteCheckBox createState() => _IsCompleteCheckBox();
}

class _IsCompleteCheckBox extends State<IsCompleteCheckBox> {
  bool _isComplete = NovelData.novel.isComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Color.fromRGBO(255, 255, 255, 0.2),
          value: _isComplete,
          onChanged: (bool newValue) {
            NovelData.isChanged = true;
            NovelData.novel.isComplete = newValue;

            setState(() {
              _isComplete = newValue;
            });
          },
        ),
        Text('Mark Complete', style: TextStyle(color: textColor, fontSize: 16)),
      ],
    );
  }
}
