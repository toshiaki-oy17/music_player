import 'package:music_player/src/data/model/music.dart';

class MusicResponse {
  int? resultCount;
  List<Music>? musics;
  String? error;

  MusicResponse({this.resultCount, this.musics});

  MusicResponse.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      musics = <Music>[];
      json['results'].forEach((v) {
        musics?.add(Music.fromJson(v));
      });
    }
    error = "";
  }

  MusicResponse.withError(String errorValue)
      : error = errorValue,
        resultCount = 0,
        musics = List<Music>.empty();
}
