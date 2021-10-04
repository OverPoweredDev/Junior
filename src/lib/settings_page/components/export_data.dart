import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Junior/model/novel.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: always_use_package_imports
import '../../theme.dart';

void showExportDataDialog(BuildContext context) async {
  String text;
  if (novelList.isNotEmpty) {
    await exportData('novelList-' + getRandomNumbers() + '.txt');
    text =
        'Your novels have been exported to your Download/Junior/ Folder as novelList-[random numbers].txt';
  } else {
    text = 'Only a non-empty novelList can be exported';
  }
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: tileColor.withAlpha(255),
    ),
  );
}

Future<bool> exportData(String filename) async {
  String data = json.encode(novelList);
  await writeFile(data, filename);
  return true;
}

Future<File> writeFile(String data, String name) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  String filePath = '/storage/emulated/0/Download/Junior/' + name;
  File file = await File(filePath).create(recursive: true);

  return file.writeAsString(data);
}

String getRandomNumbers() {
  return (DateTime.now().millisecondsSinceEpoch % 10000000).toString();
}
