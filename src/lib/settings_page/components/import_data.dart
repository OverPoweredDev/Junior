import 'dart:convert';
import 'dart:io';

import 'package:Junior/model/novel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

void showImportDataDialog(BuildContext context) async {
  await importData();
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text(
        'Your novels have been added',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: tileColor,
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
