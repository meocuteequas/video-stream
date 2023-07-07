// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            VideoPlayerView(),
            SizedBox(
              height: 20,
            ),
            Text(
                'App Service is a cloud-based hosting service for web applications',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
            SizedBox(height: 16),
            Text(
              'The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            // SizedBox(height: 16),
            // Text(
            //   'Text displayed in a RichText widget must be explicitly styled. When picking which style to use, consider using DefaultTextStyle.of the current BuildContext to provide defaults. For more details on how to style text in a RichText widget, see the documentation for TextStyle.',
            //   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            // ),
            // SizedBox(height: 16),
          ]),
        ));
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

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
        Uri.parse('http://10.0.2.2:8000/video'),
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
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(controller: _chewieController),
    );
  }
}
