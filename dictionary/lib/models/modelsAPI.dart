import 'dart:convert';

import 'dart:ffi';

ResponeApi responeApiFromJson(String str) =>
    ResponeApi.fromJson(json.decode(str));

String responeApiToJson(ResponeApi data) => json.encode(data.toJson());

class ResponeApi {
  ResponeApi({
    required this.language,
    required this.sentences,
    required this.suggestions,
    required this.tratu,
  });

  final String language;
  final List<Sentence> sentences;
  final List<dynamic> suggestions;
  final List<dynamic> tratu;

  factory ResponeApi.fromJson(Map<String, dynamic> json) => ResponeApi(
    language: json["language"],
    sentences: List<Sentence>.from(
        json["sentences"].map((x) => Sentence.fromJson(x))),
    suggestions: List<dynamic>.from(json["suggestions"].map((x) => x)),
    tratu: List<dynamic>.from(json["tratu"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "sentences": List<dynamic>.from(sentences.map((x) => x.toJson())),
    "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
    "tratu": List<dynamic>.from(tratu.map((x) => x)),
  };
}

class Sentence {
  Sentence({
    required this.id,
    required this.fields,
  });

  final String id;
  final Fields fields;

  factory Sentence.fromJson(Map<String, dynamic> json) => Sentence(
    id: json["_id"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.en,
    required this.vi,
  });

  final String en;
  final String vi;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    en: json["en"],
    vi: json["vi"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "vi": vi,
  };

}