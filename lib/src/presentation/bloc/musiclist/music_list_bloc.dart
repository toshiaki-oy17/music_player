import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/src/data/model/music.dart';

class MusicListBloc extends Cubit<List<Music>> {
	MusicListBloc() : super(<Music>[]);
	
	int _activeIndex = -1;
	
	void setMusicList(List<Music> musicList) => emit(musicList);
	List<Music> getMusicList() => state;
	
	void activateMusic(int index) {
		if (_activeIndex != -1) {
			state[_activeIndex].isPlaying = false;
		}
		state[index].isPlaying = true;
		_activeIndex = index;
		emit(state);
	}
	
	void deactivateMusic() {
		state[_activeIndex].isPlaying = false;
		_activeIndex = -1;
		emit(state);
	}
}