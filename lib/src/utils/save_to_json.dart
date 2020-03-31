import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SaveToJson {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /*Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }*/

  File _localFile = File('data/location.json');

  Future<int> readCounter() async {
    try {
      final file = _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(String data) async {
    final file = _localFile;

    // Write the file
    return file.writeAsString('$data');
  }
}