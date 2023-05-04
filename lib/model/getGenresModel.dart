import 'dart:convert';

/// data : {"genres":[{"name":"Jazz"},{"name":"Classical"},{"name":"Rock"},{"name":"Techno"},{"name":"Trance"},{"name":"Metal"},{"name":"Folk"},{"name":"Pop"},{"name":"Hip Hop"},{"name":"Black Metal"},{"name":"Bass"},{"name":"Soul Music"},{"name":"Country Music"},{"name":"Blues"},{"name":"Electronic"},{"name":"Punk Rock"},{"name":"Disco"},{"name":"Pop Rock"},{"name":"Indie Rock"},{"name":"Orchestra"},{"name":"Ambient Music"},{"name":"World Music"},{"name":"Opera"},{"name":"Contemporary"},{"name":"Drum & Bass"},{"name":"Experimental"},{"name":"Death Metal"},{"name":"Synth Pop"},{"name":"Trap"},{"name":"Breakbeat"},{"name":"Dutch Rock"},{"name":"Frenchcore"},{"name":"Gabber"},{"name":"Indorock"},{"name":"Jordaanlied"},{"name":"Levenslied"},{"name":"Nederpop"},{"name":"Palingsound"},{"name":"Ultra"}]}

GetGenresModel getGenresModelFromJson(String str) =>
    GetGenresModel.fromJson(json.decode(str));
String getGenresModelToJson(GetGenresModel data) => json.encode(data.toJson());

class GetGenresModel {
  GetGenresModel({
    this.data,
  });

  GetGenresModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// genres : [{"name":"Jazz"},{"name":"Classical"},{"name":"Rock"},{"name":"Techno"},{"name":"Trance"},{"name":"Metal"},{"name":"Folk"},{"name":"Pop"},{"name":"Hip Hop"},{"name":"Black Metal"},{"name":"Bass"},{"name":"Soul Music"},{"name":"Country Music"},{"name":"Blues"},{"name":"Electronic"},{"name":"Punk Rock"},{"name":"Disco"},{"name":"Pop Rock"},{"name":"Indie Rock"},{"name":"Orchestra"},{"name":"Ambient Music"},{"name":"World Music"},{"name":"Opera"},{"name":"Contemporary"},{"name":"Drum & Bass"},{"name":"Experimental"},{"name":"Death Metal"},{"name":"Synth Pop"},{"name":"Trap"},{"name":"Breakbeat"},{"name":"Dutch Rock"},{"name":"Frenchcore"},{"name":"Gabber"},{"name":"Indorock"},{"name":"Jordaanlied"},{"name":"Levenslied"},{"name":"Nederpop"},{"name":"Palingsound"},{"name":"Ultra"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.genres,
  });

  Data.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Jazz"

Genres genresFromJson(String str) => Genres.fromJson(json.decode(str));
String genresToJson(Genres data) => json.encode(data.toJson());

class Genres {
  Genres({
    this.name,
  });

  Genres.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }
}
