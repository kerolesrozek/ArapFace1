class UserLikeEntity {
  final String userImage;
  final String userName;
  final String userId;
   bool isSubmited;

  UserLikeEntity(
      {required this.isSubmited,
      required this.userImage,
      required this.userName,
      required this.userId});
}
