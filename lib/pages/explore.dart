// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import '../components/video.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/video_playholder.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => ExploreState();
}

Future<List<dynamic>> fetchVideos() async {
  final response =
      await http.get(Uri.parse('https://localhost:7227/media/videos'));

  if ((response.statusCode == 200)) return jsonDecode(response.body);

  throw Exception('Failed to load videos');
}

class ExploreState extends State<Explore> {
  late Future<List<dynamic>> _futureVideos;

  @override
  void initState() {
    super.initState();

    _futureVideos = fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
            future: _futureVideos,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: 48, top: index == 0 ? 24 : 0),
                        child: VideoPlaceholder(),
                      );
                    });
              }
  
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var video = snapshot.data?[index];
                    return VideoPlayerView(
                        id: video["key"],
                        title: video["title"],
                        uploaded: video["uploaded"]);
                  });
            }));
  }
}
