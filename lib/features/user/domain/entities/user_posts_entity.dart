class UserPostEntity {
  final List<dynamic> comments;
  final List<dynamic> likes;
  final String docummentId;
  final String id;
  final String postImage;
  final String postContent;
  final String time; ////////////////////////////
  final String userImage;
  final String userName;

  UserPostEntity(
      {required this.docummentId,
      required this.likes,
      required this.comments,
      required this.id,
      required this.postImage,
      required this.postContent,
      required this.time,
      required this.userImage,
      required this.userName});
}
