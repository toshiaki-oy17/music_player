import 'package:music_player/src/data/api_helper.dart';
import 'package:music_player/src/data/model/music_response.dart';

class MusicRepository {
	static final MusicRepository _singleton = MusicRepository._internal();
	
	factory MusicRepository() {
		return _singleton;
	}
	
	MusicRepository._internal();
	
	Future<MusicResponse> getMusics(String query) async => await api.getMusics(query);
}