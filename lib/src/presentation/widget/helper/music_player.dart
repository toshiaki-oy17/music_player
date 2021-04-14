import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/src/data/model/music.dart';
import 'package:music_player/src/presentation/bloc/musicplayer/music_player_bloc.dart';

class MusicPlayer extends StatefulWidget {
  final Music _music;
  final Function _hide;

  MusicPlayer(this._music, this._hide);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  /// TODO
  ///
  /// [ERROR:flutter/lib/ui/ui_dart_state.cc(186)] Unhandled Exception:
  /// This widget has been unmounted, so the State no longer has a context
  /// (and should be considered defunct).
  ///
  /// Consider canceling any active work during "dispose" or using the "mounted" getter to
  /// determine if the State is still active.
  
  late AudioPlayer? _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _player?.onPlayerStateChanged.listen((event) {
      context.read<MusicPlayerBloc>().setAudioState(event);
    });

    _play();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicPlayerBloc, AudioPlayerState>(builder: (context, state) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                if (state == AudioPlayerState.STOPPED) {
                  _play();
                } else if (state == AudioPlayerState.PAUSED) {
                  _resume();
                }
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                _pause();
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                _exit();
              },
            ),
            flex: 1,
          ),
        ],
      );
    });
  }
  
  @override
  void deactivate() {
    super.deactivate();
    _player?.stop();
  }

  @override
  void dispose() {
    super.dispose();
    _player?.dispose();
  }

  @override
  bool get mounted {
    return super.mounted;
  }

  void _play() async {
    await _player?.play(widget._music.previewUrl!);
  }

  void _pause() async {
    await _player?.pause();
  }

  void _resume() async {
    await _player?.resume();
  }

  void _exit() {
    widget._hide();
  }
}
