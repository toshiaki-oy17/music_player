abstract class MusicEvent {
	const MusicEvent();
}

class FetchMusicEvent extends MusicEvent {
	String query;
	
	FetchMusicEvent(this.query);
}