
class Post {
  final String uid;
  final String title;
  final String content;
  final String time;
  final List<String>? images;

  const Post({
    required this.uid,
    required this.title,
    required this.content,
    required this.time,
    this.images
});

}