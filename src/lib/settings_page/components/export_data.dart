import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:Junior/model/novel.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../theme.dart';

void showExportDataDialog(BuildContext context) async {
  String text;
  if(novelList != []) {
    await exportData('novelList.txt');
    text = 'Your novels have been exported to your Downloads Folder as novelList.txt';
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
  final data = utf8.encode(json.encode(novelList));
  await writeFile(data, filename);
  return true;
}

Future<File> writeFile(Uint8List data, String name) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  Directory tempDir = await DownloadsPathProvider.downloadsDirectory;
  String tempPath = tempDir.path;
  var filePath = tempPath + '/$name';

  var bytes = ByteData.view(data.buffer);
  final buffer = bytes.buffer;

  return File(filePath)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}
