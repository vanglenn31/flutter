class UserPost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numcommits;
  final String numshare;
  bool isLiked;

  UserPost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcommits,
    required this.numshare,
    required this.isLiked,
  });
}