import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/src/data/model/music.dart';
import 'package:music_player/src/presentation/base_state.dart';
import 'package:music_player/src/presentation/bloc/music/music_bloc.dart';
import 'package:music_player/src/presentation/bloc/music/music_event.dart';
import 'package:music_player/src/presentation/bloc/music/music_state.dart';
import 'package:music_player/src/presentation/bloc/musiclist/music_list_bloc.dart';
import 'package:music_player/src/presentation/bloc/musicplayer/music_player_bloc.dart';
import 'package:music_player/src/presentation/widget/helper/audio_card.dart';
import 'package:music_player/src/presentation/widget/helper/music_player.dart';

class AudioScreen extends StatefulWidget {
  @override
  State createState() => _AudioScreenState();
}

class _AudioScreenState extends BaseState<AudioScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget setBodyWidget(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
      return BlocBuilder<MusicListBloc, List<Music>>(builder: (context, musics) {
        if (state is MusicLoading) {
          setProgress(true);
          return Container();
        }
  
        if (state is MusicSuccessState) {
          setProgress(false);
          if (state.musicResponse!.error != null && state.musicResponse!.error!.length > 0) {
            return Center(
              child: Text(state.musicResponse!.error!),
            );
          }
    
          context.read<MusicListBloc>().setMusicList(state.musicResponse!.musics!);
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: musics.length,
              itemBuilder: (context, index) {
                Music music = musics[index];
                return AudioCard(music, () {
                  _activateMusic(index);
                  _showPlayer(music);
                });
              }
          );
        }
  
        if (state is MusicErrorState) {
          setProgress(false);
          return Center(
            child: Text(state.error.toString()),
          );
        }
  
        return Container();
      });
    });
  }

  @override
  AppBar setAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            hintText: "Search artist",
            hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                String text = _searchController.text.length > 0 ? _searchController.text : 'a';
                _search(text);
              },
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: _searchController.text.length > 0 ? Colors.black87 : Colors.grey))),
        textInputAction: TextInputAction.search,
        maxLines: 1,
        onSubmitted: (text) {
          text = text.length > 0 ? text : 'a';
          _search(text);
        },
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
  
  void _search(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    BlocProvider.of<MusicBloc>(context).add(FetchMusicEvent(text));
  }
  
  void _activateMusic(int index) {
    setState(() => BlocProvider.of<MusicListBloc>(context).activateMusic(index));
  }

  void _showPlayer(Music music) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    
    SnackBar snackBar = SnackBar(
      content: BlocProvider(
        create: (_) => MusicPlayerBloc(),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 48.0,
          child: MusicPlayer(music, () {
            setState(() => BlocProvider.of<MusicListBloc>(context).deactivateMusic());
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
        ),
      ),
      duration: Duration(days: 1),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  @override
  void dispose() {
    super.dispose();
    if (AudioPlayer.players.isNotEmpty) {
      AudioPlayer.players.forEach((key, value) {
        value.dispose();
      });
    }
  }
}
