class UserEntitiy {
  final String userImage;
  final String userName;
  final String? bio;
  final String userId;
  final String? docId;

  UserEntitiy({required this.userId, this.docId, 
      required this.userImage, required this.userName,  this.bio});
}
