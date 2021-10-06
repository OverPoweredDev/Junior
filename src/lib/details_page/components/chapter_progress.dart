// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:junior/details_page/components/novel_data.dart';
// ignore: always_use_package_imports
import 'package:junior/theme.dart';

class ChapterProgress extends StatefulWidget {
  const ChapterProgress({Key key}) : super(key: key);

  @override
  _ChapterProgress createState() => _ChapterProgress();
}

class _ChapterProgress extends State<ChapterProgress> {
  String novelStatus = NovelData.novel.novelStatus;

  bool hasVolumes = NovelData.novel.hasVolumes;

  int currVolume = NovelData.novel.currVolume;
  int currChapter = NovelData.novel.currChapter;
  int totalVolumes = NovelData.novel.totalVolumes;
  int totalChapters = NovelData.novel.totalChapters;

  bool isComplete = NovelData.novel.isComplete;

  void updateStatus(String newStatus) {
    NovelData.isChanged = true;
    NovelData.novel.novelStatus = newStatus;
    novelStatus = newStatus;
    setState(() {});
  }

  void changeChapterOrVolume(bool newValue) {
    NovelData.isChanged = true;
    NovelData.novel.hasVolumes = newValue;
    hasVolumes = newValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChapterProgressTitle(hasVolumes, changeChapterOrVolume),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VolumeOrChapterProgress(
              hasVolumes: hasVolumes,
              currVolume: currVolume,
              currChapter: currChapter,
              totalVolumes: totalVolumes,
              totalChapters: totalChapters,
            ),
            NovelStatus(novelStatus, updateStatus),
          ],
        ),
      ],
    );
  }
}

class ChapterProgressTitle extends StatelessWidget {
  final bool hasVolumes;
  final void Function(bool option) setHasVolumes;

  // ignore: sort_constructors_first,
  const ChapterProgressTitle(this.hasVolumes, this.setHasVolumes);

  Color getSelectedColor(bool hasVolumes, String chapterOrVolume) {
    Color dullColor = textColor.withOpacity(0.8);
    Color brightColor = textColor;

    if (chapterOrVolume == 'Chapter') {
      if (hasVolumes) {
        return dullColor;
      } else {
        return brightColor;
      }
    } else {
      if (hasVolumes) {
        return brightColor;
      } else {
        return dullColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          child: Text(
            'Chapter',
            style: TextStyle(
                color: getSelectedColor(hasVolumes, 'Chapter'), fontSize: 16),
          ),
          onTap: () {
            setHasVolumes(false);
          },
        ),
        Text(
          ' / ',
          style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 16),
        ),
        InkWell(
            splashColor: Colors.transparent,
            child: Text(
              'Volume',
              style: TextStyle(
                  color: getSelectedColor(hasVolumes, 'Volume'), fontSize: 16),
            ),
            onTap: () {
              setHasVolumes(true);
            }),
        Text(
          ' Progress',
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ],
    );
  }
}

class VolumeOrChapterProgress extends StatelessWidget {
  final bool hasVolumes;
  final int currChapter, totalChapters, currVolume, totalVolumes;

  final TextEditingController _currVol = TextEditingController();
  final TextEditingController _currChap = TextEditingController();
  final TextEditingController _totalVol = TextEditingController();
  final TextEditingController _totalChap = TextEditingController();

  // ignore: sort_constructors_first
  VolumeOrChapterProgress(
      {Key key,
      this.hasVolumes,
      this.currChapter,
      this.currVolume,
      this.totalChapters,
      this.totalVolumes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasVolumes) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('v', style: TextStyle(color: textColor, fontSize: 16)),
          const SizedBox(width: 5),
          ChapterInputField(
            chapterNum: currVolume.toString(),
            width: 30,
            onTextChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.currVolume = int.parse(text);
            },
            myController: _currVol,
          ),
          const SizedBox(width: 5),
          Text('c', style: TextStyle(color: textColor, fontSize: 16)),
          const SizedBox(width: 5),
          ChapterInputField(
            chapterNum: currChapter.toString(),
            width: 40,
            onTextChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.currChapter = int.parse(text);
            },
            myController: _currVol,
          ),
          const SizedBox(width: 5),
          Text('/', style: TextStyle(color: textColor, fontSize: 24)),
          const SizedBox(width: 5),
          Text('v', style: TextStyle(color: textColor, fontSize: 16)),
          const SizedBox(width: 5),
          ChapterInputField(
            chapterNum: totalVolumes.toString(),
            width: 30,
            onTextChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.totalVolumes = int.parse(text);
            },
            myController: _totalVol,
          ),
          const SizedBox(width: 5),
          Text('c', style: TextStyle(color: textColor, fontSize: 16)),
          const SizedBox(width: 5),
          ChapterInputField(
            chapterNum: totalChapters.toString(),
            width: 40,
            onTextChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.totalChapters = int.parse(text);
            },
            myController: _totalChap,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('c', style: TextStyle(color: textColor, fontSize: 16)),
          const SizedBox(width: 5),
          ChapterInputField(
            chapterNum: currChapter.toString(),
            width: 55,
            onTextChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.currChapter = int.parse(text);
            },
            myController: _currChap,
          ),
          const SizedBox(width: 5),
          Text('/', style: TextStyle(color: textColor, fontSize: 24)),
          const SizedBox(width: 5),
          ChapterInputField(
            chapterNum: totalChapters.toString(),
            width: 55,
            onTextChanged: (String text) {
              NovelData.isChanged = true;
              NovelData.novel.totalChapters = int.parse(text);
            },
            myController: _totalChap,
          ),
        ],
      );
    }
  }
}

class ChapterInputField extends StatelessWidget {
  final Function(String) onTextChanged;
  final String chapterNum;
  final double width;
  final TextEditingController myController;

  // ignore: sort_constructors_first
  const ChapterInputField(
      {@required this.onTextChanged,
      this.chapterNum,
      this.width,
      @required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
          controller: myController
            ..text = (chapterNum == '0') ? '' : chapterNum,
          style: TextStyle(color: textColor),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            isDense: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(5),
          ),
          onChanged: onTextChanged,
          onTap: () => myController.selectAll()),
    );
  }
}

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text == null || text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}

class NovelStatus extends StatelessWidget {
  final String novelStatus;
  final void Function(String) updateStatus;

  // ignore: sort_constructors_first
  const NovelStatus(this.novelStatus, this.updateStatus);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(255, 255, 255, 0.1),
      borderRadius: BorderRadius.circular(6.0),
      child: SizedBox(
        width: 100,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Text(
              novelStatus,
              style: TextStyle(color: textColor, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            if (novelStatus == 'Complete') {
              updateStatus('On Hiatus');
            } else if (novelStatus == 'Ongoing') {
              updateStatus('Complete');
            } else if (novelStatus == 'On Hiatus') {
              updateStatus('Ongoing');
            }
          },
        ),
      ),
    );
  }
}
