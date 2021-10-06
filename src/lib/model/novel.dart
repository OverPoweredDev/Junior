import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

List novelList = [];

class Novel {
  String title;
  String notes;
  String novelLink;
  String novelStatus;

  List<String> novelTags;

  DateTime lastEdited;

  int currChapter;
  int totalChapters;

  bool hasVolumes;
  int currVolume;
  int totalVolumes;

  int novelRating;
  bool isComplete;

  // ignore: sort_constructors_first
  Novel({
    @required this.title,
    @required this.lastEdited,
    this.currChapter = 0,
    this.totalChapters = 0,
    this.hasVolumes = false,
    this.currVolume = 0,
    this.totalVolumes = 0,
    this.notes = '',
    this.novelRating = 0,
    this.novelTags = const <String>[],
    this.novelStatus = 'Ongoing',
    this.isComplete = false,
    this.novelLink = '',
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'notes': notes,
        'lastEdited': lastEdited.toString(),
        'currChapter': currChapter,
        'totalChapters': totalChapters,
        'hasVolumes': hasVolumes,
        'currVolume': currVolume,
        'totalVolumes': totalVolumes,
        'novelRating': novelRating,
        'novelTags': novelTags,
        'novelStatus': novelStatus,
        'isComplete': isComplete,
        'novelLink': novelLink,
      };

  // ignore: sort_constructors_first
  Novel.fromJson(Map<String, dynamic> json)
      : title = getFromJson(json, 'title', ''),
        notes = getFromJson(json, 'notes', ''),
        lastEdited = DateTime.parse(json['lastEdited']),
        currChapter = getFromJson(json, 'currChapter', 0),
        totalChapters = getFromJson(json, 'totalChapters', 0),
        hasVolumes = getFromJson(json, 'hasVolumes', false),
        currVolume = getFromJson(json, 'currVolume', 0),
        totalVolumes = getFromJson(json, 'totalVolumes', 0),
        novelRating = getFromJson(json, 'novelRating', 0),
        novelTags = getFromJson(json, 'novelTags', <String>[]),
        novelStatus = getFromJson(json, 'novelStatus', 'Ongoing'),
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

  updateNovelStatus() {
    if (isComplete) {
      novelStatus = 'Complete';
      isComplete = false;
    }
  }

  String getChapterProgress() {
    updateNovelStatus();

    String text = '';

    if (!hasVolumes) {
      if (currChapter != 0) {
        text += 'c' + currChapter.toString();

        if (totalChapters != 0) {
          text += '/' + totalChapters.toString();
        }

        text += ' • ';
      }
    } else if (hasVolumes) {
      if (currVolume != 0) {
        text += 'v' + currVolume.toString();

        if (currChapter != 0) {
          text += 'c' + currChapter.toString();
        }

        if (totalVolumes != 0) {
          text += '/v' + totalVolumes.toString();

          if (totalChapters != 0) {
            text += 'c' + totalChapters.toString();
          }
        }
        text += ' • ';

      } else if (currChapter != 0) {
        text += 'c' + currChapter.toString();

        if (totalChapters != 0) {
          text += '/' + totalChapters.toString();
        }

        text += ' • ';
      }
    }

    text += novelStatus;

    return text;
  }

  bool contains(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
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
