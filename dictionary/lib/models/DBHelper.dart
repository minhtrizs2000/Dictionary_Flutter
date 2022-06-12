import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'modelsDictionary.dart';
import 'dart:convert';

class DBHelper {
  late Database _db;

  Future<void> init() async {
    Directory applicationDirectory = await getApplicationDocumentsDirectory();

    String dbPathEnglish =
    path.join(applicationDirectory.path, "dictionary.db");

    bool dbExistsEnglish = await File(dbPathEnglish).exists();

    if (!dbExistsEnglish) {
      // Copy from asset
      ByteData data =
      await rootBundle.load(path.join("assets", "dictionary.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(dbPathEnglish).writeAsBytes(bytes, flush: true);
    }

    this._db = await openDatabase(dbPathEnglish);
  }

  Future<String> checkConnection() async{
    Directory applicationDirectory = await getApplicationDocumentsDirectory();

    String dbPathEnglish =
    path.join(applicationDirectory.path, "dictionary.db");

    bool dbExistsEnglish = await File(dbPathEnglish).exists();
    if(dbExistsEnglish){
      return "Connected";
    }
    else{
      return "Not Connected";
    }

  }

  Future<String> getAllTheWordsEnglish() async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> maps = await _db.rawQuery("SELECT * FROM av where word like 'sub%'");
    List<avModel> words = [];
    return maps.length.toString();
  }

  // querry word in av table return list of avModel
  Future<List<avModel>> getWord(String word) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> maps = await _db.rawQuery(
        "SELECT * FROM av where word like '%$word%'");
    List<avModel> words = [];
    for (int i = 0; i < maps.length; i++) {
      words.add(avModel.fromMap(maps[i]));
    }
    return words;
  }

  // querry word in av table return list of vaModel
  Future<List<vaModel>> getWordVietnamese(String word) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> maps = await _db.rawQuery(
        "SELECT * FROM va where word like '%$word%'");
    List<vaModel> words = [];
    for (int i = 0; i < maps.length; i++) {
      words.add(vaModel.fromMap(maps[i]));
    }
    return words;
  }

  //querry add history word by id_av
  Future<void> addHistoryWord(int id_av) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    await _db.rawInsert(
        "INSERT INTO lichsu (id_av) VALUES ($id_av)");
  }

  //querry add marked word by id_av
  Future<void> addMarkedWord(int id_av) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    await _db.rawInsert(
        "INSERT INTO danhdau (id_av) VALUES ($id_av)");
  }

  //querry get all history word
  Future<List<HistoryWord>> getAllHistoryWord() async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> maps = await _db.rawQuery("SELECT * FROM lichsu");
    List<HistoryWord> words = [];
    for (int i = 0; i < maps.length; i++) {
      words.add(HistoryWord.fromMap(maps[i]));
    }
    return words;
  }

  //querry get all marked word
  Future<List<MarkedWord>> getAllMarkedWord() async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> maps = await _db.rawQuery("SELECT * FROM danhdau");
    List<MarkedWord> words = [];
    for (int i = 0; i < maps.length; i++) {
      words.add(MarkedWord.fromMap(maps[i]));
    }
    return words;
  }

  //delete history word by id_av
  Future<void> deleteHistoryWord(int id_av) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    await _db.rawDelete(
        "DELETE FROM lichsu WHERE id_av = $id_av");
  }

  //delete history word by id_av

  Future<void> deleteHistoryWordva(int id_va) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    await _db.rawDelete(
        "DELETE FROM lichsu WHERE id_av = $id_va");
  }

  //delete marked word by id_av
  Future<void> deleteMarkedWord(int id_av) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    await _db.rawDelete(
        "DELETE FROM danhdau WHERE id_av = $id_av");
  }

  //get word by id_av
  Future<avModel> getWordById(int id_av) async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> maps = await _db.rawQuery(
        "SELECT * FROM av where id = $id_av");
    return avModel.fromMap(maps[0]);
  }

}