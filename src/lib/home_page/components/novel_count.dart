import 'package:flutter/material.dart';
import 'package:junior/theme.dart';

class NovelCount extends StatelessWidget {
  const NovelCount(this.numNovels);
  final int numNovels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            numNovels.toString() + " Novels in List",
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}