import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class DBHelper{
  copyDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String p = path.join(documentsDirectory.path, "dictionary.db");

    if(FileSystemEntity.typeSync(p)==FileSystemEntityType.notFound){
      ByteData data = await rootBundle.load(path.join('assets/db','dictionary.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(p).writeAsBytes(bytes);
    }
  }
}