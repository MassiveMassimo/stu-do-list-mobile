import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/screens/drawer_screen.dart';
import 'package:mobile/screens/video-playlist/models/video_playlist_models.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/screens/video-playlist/screens/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

class VideoPlaylistPage extends StatefulWidget {
  const VideoPlaylistPage({Key? key}) : super(key: key);

  @override
  _VideoPlaylistPageState createState() => _VideoPlaylistPageState();
}

class _VideoPlaylistPageState extends State<VideoPlaylistPage> {
  List<VideoPlaylistModel> playlist = [];
  fetch_video() async {
    try {
      String herokuURL =
          'https://stu-do-list.herokuapp.com/video-playlist/get-playlist';

      final response = await http.get(Uri.parse(herokuURL));
      final jsonObject = jsonDecode(response.body);

      for (var video in jsonObject) {
        Fields fields = Fields(
            title: video["fields"]["Title"], link: video["fields"]["Link"]);
        VideoPlaylistModel videoPlaylistModel = VideoPlaylistModel(
            model: video["model"], pk: video["pk"], fields: fields);
        playlist.add(videoPlaylistModel);
      }
      return playlist;
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text('Video Playlist',
            style: TextStyle(color: Colors.grey.shade200)),
        backgroundColor: Color.fromARGB(255, 33, 37, 41),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: fetch_video(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Video is unavailable"),
                  ),
                );
              } else {
                return Column(
                    children: playlist.map((e) {
                  return ChewieListItem(
                    videoPlayerController:
                        VideoPlayerController.network(e.fields.link),
                    looping: false,
                  );
                }).toList());
              }
            },
          ),
        ),
      ),
    );
  }
}
