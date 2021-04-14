import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicPlayerBloc extends Cubit<AudioPlayerState> {
	MusicPlayerBloc() : super(AudioPlayerState.STOPPED);
	
	void setAudioState(AudioPlayerState state) => emit(state);
}