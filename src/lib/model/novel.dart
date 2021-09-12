import 'dart:convert';
import 'dart:io';

import 'package:Junior/model/preferences.dart';
import 'package:Junior/settings_page/components/export_data.dart';
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
      : title = getFromJson(json, 'title', ''),
        notes = getFromJson(json, 'notes', ''),
        lastEdited = DateTime.parse(json['lastEdited']),
        currChapter = getFromJson(json, 'currChapter', 0),
        totalChapters = getFromJson(json, 'totalChapters', 0),
        novelRating = getFromJson(json, 'novelRating', 0),
        isComplete = getFromJson(json, 'isComplete', false),
        novelLink = getFromJson(json, 'novelLink', '');

  static dynamic getFromJson(
      Map<String, dynamic> json, String key, dynamic defaultValue) {
    if (json.containsKey(key)) {
      return json[key];
    } else {
      return defaultValue;
    }
  }

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
    return this.title.toLowerCase().contains(query.toLowerCase());
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

  final prefs = await loadPreferences();
  if (prefs.exportAutomatically) exportData('novelList-autosave.txt');

  return file.writeAsString(novelListJSON);
}

Future<List> getNovelList() async {
  final file = await _localFile;
  final contents = await file.readAsString();

  Iterable l = json.decode(contents);
  novelList = List.from(l.map((model) => Novel.fromJson(model)));

  return novelList;
}
