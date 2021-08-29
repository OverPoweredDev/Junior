import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

List novelList = [];

class Novel {
  String title;
  String notes;
  String novelLink;

  DateTime lastEdited;

  int currChapter;
  int totalChapters;

  int novelRating;
  bool isComplete;

  Novel({
    @required this.title,
    @required this.lastEdited,
    this.currChapter = 0,
    this.totalChapters = 0,
    this.notes = '',
    this.novelRating = 0,
    this.isComplete = false,
    this.novelLink = '',
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'notes': notes,
        'lastEdited': lastEdited.toString(),
        'currChapter': currChapter,
        'totalChapters': totalChapters,
        'novelRating': novelRating,
        'isComplete': isComplete,
        'novelLink': novelLink,
      };

  Novel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        notes = json['notes'],
        lastEdited = DateTime.parse(json['lastEdited']),
        currChapter = json['currChapter'],
        totalChapters = json['totalChapters'],
        novelRating = json['novelRating'],
        isComplete = json['isComplete'],
        novelLink = json['novelLink'];

  String getChapterProgress() {
    String progress = '';

    if (this.isComplete) {
      progress += 'Complete';
    } else if (this.currChapter != 0 && this.totalChapters != 0) {
      progress += 'c' +
          this.currChapter.toString() +
          '/' +
          this.totalChapters.toString();
    } else if (this.currChapter != 0 && this.totalChapters == 0) {
      progress += 'c' + this.currChapter.toString();
    }

    return progress;
  }

  bool contains(String query) {
    return this.title.contains(query);
  }
}

Future<File> get _localFile async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;

  return File('$path/novels.json');
}

Future<File> saveNovelList(novelList) async {
  final file = await _localFile;
  final novelListJSON = jsonEncode(novelList);

  return file.writeAsString(novelListJSON);
}

Future<List> getNovelList() async {
  final file = await _localFile;
  final contents = await file.readAsString();

  Iterable l = json.decode(contents);
  novelList = List.from(l.map((model) => Novel.fromJson(model)));

  // novelList = [
  //   Novel(
  //       title: "Reverend Insanity",
  //       lastEdited: DateTime.now(),
  //       currChapter: 1123,
  //       totalChapters: 2314,
  //       isComplete: false,
  //       novelRating: 5,
  //       notes:
  //           'A story of a villain, Fang Yuan who was reborn 500 years into the past with the Spring Autumn Cicada he painstakingly refined. With his profound wisdom, battle and life experiences, he seeks to overcome his foes with skill and wit! Ruthless and amoral, he has no need to hold back as he pursues his ultimate goals. In a world of cruelty where one cultivates using Gu – magical creatures of the world – Fang Yuan must rise up above all with his own power.'),
  //   Novel(
  //       title: 'A Record of a Mortals Journey to Immortality',
  //       lastEdited: DateTime.now(),
  //       currChapter: 123,
  //       totalChapters: 2446,
  //       isComplete: false,
  //       novelRating: 5,
  //       notes:
  //           'A poor and ordinary boy from a village joins a minor sect in Jiang Hu and becomes an Unofficial Disciple by chance. How will Han Li, a commoner by birth, establish a foothold for himself in his sect? With his mediocre aptitude, how will he successfully traverse the path of cultivation and become an immortal? This is a story of an ordinary mortal who, against all odds, clashes with devilish demons and the ancient celestials in order to find his own path to immortality'),
  //   Novel(
  //       title: 'I Might Be A Fake Cultivator',
  //       lastEdited: DateTime.now(),
  //       currChapter: 342,
  //       totalChapters: 2398,
  //       isComplete: false,
  //       novelRating: 4,
  //       notes:
  //           'On modern-day Earth, An Lin seems to have been abandoned by God. When his father suddenly disappears, An Lin is left with his fathers immense debt, putting his life at risk. After being forced to a rooftop by his pursuing creditors, An Lin is unexpectedly swept off his feet and brought to the ground safely.'),
  //   Novel(
  //       title: 'Little Tyrant Doesnt Want to Meet with a Bad End',
  //       lastEdited: DateTime.now(),
  //       currChapter: 635,
  //       totalChapters: 635,
  //       isComplete: true,
  //       novelRating: 3,
  //       notes:
  //           'The moment the little tyrant of the nobles, Roel Ascart, saw his stepsister, he recalled his memories. He realized that he was in the world of a gal game he played in his previous life. To make things worse, he was the greatest villain in the common route of the game!'),
  // ];

  return novelList;
}
