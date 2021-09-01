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
    String text = '';

    if (this.currChapter != 0) {
      text += 'c' + this.currChapter.toString();

      if (this.totalChapters != 0) {
        text += '/' + this.totalChapters.toString();
      }

      if (this.isComplete) {
        text += ' • Complete';
      } else {
        text += ' • Ongoing';
      }
    } else if (this.isComplete) {
      text += 'Complete';
    } else {
      text += 'Ongoing';
    }

    return text;
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

  return novelList;
}
