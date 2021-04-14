import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/data/model/music.dart';

class AudioCard extends StatelessWidget {
  final Music _music;
  final Function _play;

  AudioCard(this._music, this._play);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _play();
      },
      child: Container(
        decoration: _music.isPlaying! ? BoxDecoration(color: Colors.black12,) : BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/music_placeholder.png"),
                      image: NetworkImage(_music.artworkUrl100!),
                      fit: BoxFit.fill,
                    ),
                    flex: 2,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _music.trackName!,
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(_music.artistName!),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(_music.collectionCensoredName!),
                      ],
                    ),
                    flex: 7,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: _music.isPlaying!
                        ? Image.asset(
                            "assets/images/now_playing.gif",
                            height: 24.0,
                            width: 24.0,
                          )
                        : Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
          ]
        ),
      ),
    );
  }
}
