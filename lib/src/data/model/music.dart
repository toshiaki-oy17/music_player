class Music {
  String? wrapperType;
  String? kind;
  int? artistId;
  int? trackId;
  String? artistName;
  String? trackName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  int? collectionId;
  String? collectionName;
  String? collectionCensoredName;
  String? collectionViewUrl;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  bool? isStreamable;
  int? collectionArtistId;
  String? collectionArtistName;
  bool? isPlaying;

  Music(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.trackId,
      this.artistName,
      this.trackName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.collectionId,
      this.collectionName,
      this.collectionCensoredName,
      this.collectionViewUrl,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.isStreamable,
      this.collectionArtistId,
      this.collectionArtistName,
      this.isPlaying});

  Music.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    artistId = json['artistId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    trackName = json['trackName'];
    trackCensoredName = json['trackCensoredName'];
    artistViewUrl = json['artistViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'] != null ? json['collectionPrice'].toDouble() : 0.0;
    trackPrice = json['trackPrice'] != null ? json['trackPrice'].toDouble() : 0.0;
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    collectionCensoredName = json['collectionCensoredName'];
    collectionViewUrl = json['collectionViewUrl'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    isStreamable = json['isStreamable'];
    collectionArtistId = json['collectionArtistId'];
    collectionArtistName = json['collectionArtistName'];
    isPlaying = false;
  }
}
