import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'locator.dart';

Future<List<File>> pickImages() async {
  final List<File> images = [];
  try {
    final result = await locator.get<FilePicker>().pickFiles(
          type: FileType.image,
          allowMultiple: true,
        );
    if (result != null && result.files.isNotEmpty) {
      images.addAll(result.files.map((file) => File(file.path!)));
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
