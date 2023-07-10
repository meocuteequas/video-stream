// ignore_for_file: prefer_const_constructors

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String id;
  final String title;
  final String uploaded;
  const VideoPlayerView({super.key, required this.id, required this.title, required this.uploaded});


  @override
  State<StatefulWidget> createState() => VideoPlayerViewState();
}

class VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
        Uri.parse('https://localhost:7227/media/videos/${widget.id}'),
        httpHeaders: {'Range': 'bytes=0-'})
      ..initialize().then((_) => {setState(() {})}).onError(
          (error, stackTrace) => {debugPrint('ERROR: $error $stackTrace')});

    _chewieController = ChewieController(
        videoPlayerController: _videoController, aspectRatio: 16 / 9);
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(controller: _chewieController),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        widget.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      Text("5.2k views - ${widget.uploaded}",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      SizedBox(
        height: 48,
      ),
    ]);
  }
}
