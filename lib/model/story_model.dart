import 'package:insta_story/model/user_model.dart';

enum MediaType {
  image,
  video,
}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final User user;

  Story(
      {required this.url,
      required this.media,
      required this.duration,
      required this.user});
}
