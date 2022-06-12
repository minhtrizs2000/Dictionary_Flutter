import 'dart:convert';

class avModel {
  int id;
  String word;
  String description;
  String? pronunce;
  avModel(
      {required this.id,
        required this.word,
        required this.description,
        required this.pronunce});

  factory avModel.fromRawJson(String str) => avModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory avModel.fromJson(Map<String, dynamic> json) => avModel(
    id: json["id"],
    word: json["word"],
    description: json["description"],
    pronunce: json["pronunce"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "word": word,
    "description": description,
    "pronunce": pronunce,
  };

  static avModel fromMap(Map map) {


    return avModel(
        id: map['id'],
        word: map['word'],
        description: map['description'],
        pronunce: map['pronunce']);
  }

}

class vaModel {
  int id;
  String Word;
  String description;
  String? pronunce;
  vaModel(
      {required this.id,
        required this.Word,
        required this.description,
        required this.pronunce});

  factory vaModel.fromRawJson(String str) => vaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory vaModel.fromJson(Map<String, dynamic> json) => vaModel(
    id: json["id"],
    Word: json["Word"],
    description: json["description"],
    pronunce: json["pronunce"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Word": Word,
    "description": description,
    "pronunce": pronunce,
  };

  static vaModel fromMap(Map map) {


    return vaModel(
        id: map['id'],
        Word: map['Word'],
        description: map['description'],
        pronunce: map['pronunce']);
  }
}

class MarkedWord {
  int id_av;
  MarkedWord({required this.id_av});
  factory MarkedWord.fromJson(Map<String, dynamic> json) => MarkedWord(
    id_av: json["id_av"],
  );

  static MarkedWord fromMap(Map map) {


    return MarkedWord(
        id_av: map['id_av']);
  }
}

class HistoryWord {
  int? id_av;
  int? id_va;
  HistoryWord({required this.id_av, required this.id_va});
  factory HistoryWord.fromJson(Map<String, dynamic> json) => HistoryWord(
    id_av: json["id_av"],
    id_va: json["id_va"],
  );


  static HistoryWord fromMap(Map map) {
    return HistoryWord(
        id_av: map['id_av'],
        id_va: map['id_va']);
  }
}