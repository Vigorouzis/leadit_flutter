import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String abstractTitle;
  @HiveField(2)
  String smallPhotoUrl;
  @HiveField(3)
  String newsURL;

  Post({
    this.title,
    this.abstractTitle,
    this.smallPhotoUrl,
    this.newsURL,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List multiMediaList = json['multimedia'];
    return Post(
      title: json['title'],
      abstractTitle: json['abstract'],
      smallPhotoUrl: multiMediaList[3]['url'],
      newsURL: json['short_url'],
    );
  }
}
