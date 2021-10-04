import 'dart:convert';
import 'dart:io';

import 'package:Junior/model/novel.dart';
import 'package:Junior/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showImportDataDialog(BuildContext context) async {
  bool success = await importData();
  String dialogTextContent;

  if (success) {
    dialogTextContent = 'Your novels have been added';
  } else {
    dialogTextContent = 'Import Operation Cancelled';
  }

  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        dialogTextContent,
        style: TextStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
      backgroundColor: tileColor.withAlpha(255),
    ),
  );
}

Future<bool> importData() async {
  FilePickerResult result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path);
    final contents = await file.readAsString();

    Iterable l = json.decode(contents);
    final newNovels = List.from(l.map((model) => Novel.fromJson(model)));

    novelList.addAll(newNovels);
    saveNovelList(novelList);
    return true;
  } else {
    // User canceled the picker
    return false;
  }
}
