Music Player App from iTunes Affiliate API.

# Supported Devices:
Android: JellyBean 4.1 or later
iOS: iOS 9.0 or later

# Support Features:
- Show List of Musics
- Search by Artist, then get List of Music
- Play and Pause the Music

# Requirements to build the app:
Library:
- alice as an HTTP Inspector for check API Request and Response
- dio as HTTP Client
- modal_progress_hud_nsn as Circular Indicator
- flutter_bloc as BLoC 
- audioplayers as Audio Player
Component:
- core as constants
- data as API List and List of Model
- presentation includes BLoC and widget
- repository as connector between presentation and data. Either for HTTP Client or SQLite Database.