import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/src/data/api_helper.dart';
import 'package:music_player/src/presentation/bloc/base_bloc.dart';
import 'package:music_player/src/presentation/bloc/music/music_bloc.dart';
import 'package:music_player/src/presentation/bloc/music/music_event.dart';
import 'package:music_player/src/presentation/bloc/musiclist/music_list_bloc.dart';
import 'package:music_player/src/presentation/widget/screen/audio_screen.dart';

Future<void> main() async {
  AudioPlayer.logEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    return MaterialApp(
      navigatorKey: api.getAliceKey(),
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MusicBloc()..add(FetchMusicEvent("a")),
          ),
          BlocProvider(
            create: (_) => MusicListBloc(),
          ),
          BlocProvider(
            create: (_) => BaseBloc(),
          ),
        ],
        child: AudioScreen(),
      ),
    );
  }
}
