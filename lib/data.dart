import 'package:insta_story/model/story_model.dart';
import 'package:insta_story/model/user_model.dart';

final User user = User(
  name: 'John Doe',
  profileImageUrl:
      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
);

final List<Story> stories = [
  Story(
    url: "https://cdn.pixabay.com/user/2018/12/22/14-08-41-65_250x250.jpg",
    media: MediaType.image,
    duration: Duration(seconds: 10),
    user: user,
  ),
  Story(
      url:
          "https://images.unsplash.com/photo-1628784230353-5bee16e2f005?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      media: MediaType.image,
      duration: const Duration(seconds: 7),
      user: User(
          name: 'John Doe',
          profileImageUrl:
              "https://img.freepik.com/premium-photo/indian-young-happy-man-image_181020-2462.jpg")),
  Story(
    url:
        "https://www.shutterstock.com/image-illustration/pristine-reflective-lake-show-image-260nw-2305485315.jpg",
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url:
        "https://images.pexels.com/photos/3782463/pexels-photo-3782463.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=236.25&fit=crop&h=382.5",
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    url:
        "https://images.pexels.com/photos/516541/pexels-photo-516541.jpeg?auto=compress&cs=tinysrgb&w=400",
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    url:
        "https://images.pexels.com/photos/2674052/pexels-photo-2674052.jpeg?auto=compress&cs=tinysrgb&w=400",
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
];
