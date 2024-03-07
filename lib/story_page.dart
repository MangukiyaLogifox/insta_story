// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:insta_story/model/story_model.dart';
import 'package:video_player/video_player.dart';

class StoryViewPage extends StatefulWidget {
  final List<Story> stories;

  StoryViewPage({super.key, required this.stories});

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animationController;
  int _currentIndex = 0;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);
    _videoController?.play();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
            onTapDown: (details) => _onTapDown(details, story),
            child: PageView.builder(
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                        imageUrl: story.url, fit: BoxFit.cover);
                  case MediaType.video:
                    return FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _videoController?.value.size.width,
                        height: _videoController?.value.size.height,
                        child: const SizedBox(),
                      ),
                    );
                }
              },
            )));
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
        } else {
          _currentIndex = 0;
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController!.value.isPlaying) {
          _videoController?.pause();
        } else {
          _videoController?.play();
        }
      }
    }
  }
}
