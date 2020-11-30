import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScroll extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const VideoPlayerScroll({Key key, this.videoPlayerController, this.looping})
      : super(key: key);

  @override
  _VideoPlayerScrollState createState() => _VideoPlayerScrollState();
}

class _VideoPlayerScrollState extends State<VideoPlayerScroll> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        looping: widget.looping,
        errorBuilder: (context, errorMsg) {
          return Center(
            child: Text(
              (errorMsg),
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
    super.dispose();
  }
}
