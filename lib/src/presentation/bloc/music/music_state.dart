import 'package:music_player/src/data/model/music_response.dart';

class MusicState {}

class MusicInitialState extends MusicState {}

class MusicLoading extends MusicState {}

class MusicSuccessState extends MusicState {
	MusicResponse? musicResponse;
	MusicSuccessState(this.musicResponse);
}

class MusicErrorState extends MusicState {
	Error? error;
	MusicErrorState(this.error);
}