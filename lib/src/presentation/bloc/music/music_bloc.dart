import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/src/data/model/music_response.dart';
import 'package:music_player/src/presentation/bloc/music/music_event.dart';
import 'package:music_player/src/presentation/bloc/music/music_state.dart';
import 'package:music_player/src/repository/music_repository.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
	MusicBloc() : super(MusicInitialState());
	
	MusicRepository _repository = MusicRepository();
	
	@override
  Stream<MusicState> mapEventToState(MusicEvent event) async* {
		if (event is FetchMusicEvent) {
			yield MusicLoading();
			try {
				MusicResponse response = await _repository.getMusics(event.query);
				yield MusicSuccessState(response);
			} on Error catch (e) {
				yield MusicErrorState(e);
			}
		}
  }
}