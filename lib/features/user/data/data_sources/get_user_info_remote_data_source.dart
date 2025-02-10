import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class GetUserInfoRemoteDataSource {
  Future<UserEntitiy> getUserInfo();
  Future<List<UserPostEntity>> getUserPosts();
  Future<void> addComment(
      {required UserCommentEntity userComment, required String docId});
  Future<List<UserCommentEntity>> getPostComments({required String docId});
  Future<void> editProfile(
      {required UserEntitiy userEntity, required String docId});
}

class GetUserInfoRemoteDataSourceImple extends GetUserInfoRemoteDataSource {
  @override
  Future<UserEntitiy> getUserInfo() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    var results = await users
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserEntitiy(
        userImage: results.docs.first['userImage'],
        userName: results.docs.first['userName'],
        bio: results.docs.first['bio'],
        userId: results.docs.first['userId'],
        docId: results.docs.first['docId']);
  }

  @override
  Future<List<UserPostEntity>> getUserPosts() async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    QuerySnapshot querySnapshot = await posts
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('time', descending: true)
        .get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;

    List<UserPostEntity> userPosts = [];
    for (var element in docs) {
      userPosts.add(UserPostEntity(
          comments: element['comments'],
          docummentId: element['docId'],
          id: element['userId'],
          postImage: element['postImage'],
          postContent: element['postContent'],
          time: element['time'],
          userImage: element['userImage'],
          userName: element['userName'],
          likes: element['likes']));
    }
    return userPosts;
  }

  @override
  Future<void> addComment(
      {required UserCommentEntity userComment, required String docId}) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    DocumentSnapshot documentSnapshot = await posts.doc(docId).get();

    List<dynamic> comments = documentSnapshot['comments'];
    comments.add({
      'comment': userComment.comment,
      'userName': userComment.userName,
      'userImage': userComment.userImage
    });
    posts.doc(docId).update({'comments': comments});
  }

  @override
  Future<List<UserCommentEntity>> getPostComments(
      {required String docId}) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    DocumentSnapshot documentSnapshot = await posts.doc(docId).get();
    List<dynamic> comments = documentSnapshot['comments'];
    List<UserCommentEntity> commentsList = [];
    for (var element in comments) {
      commentsList.add(UserCommentEntity(
          comment: element['comment'],
          userImage: element['userImage'],
          userName: element['userName']));
    }
    return commentsList;
  }

  @override
  Future<void> editProfile(
      {required UserEntitiy userEntity, required String docId}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(docId).update({
      'userImage': userEntity.userImage,
      'userName': userEntity.userName,
      'bio': userEntity.bio,
    });
    // تحديث صورة اليوزر في جميع البوستات

    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    QuerySnapshot querySnapshot = await posts
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    for (var element in docs) {
      await element.reference.update(
          {'userImage': userEntity.userImage, 'userName': userEntity.userName});
    }

    // تحديث صورة اليوزر في جميع الكومنتات داخل كل بوست

    // QuerySnapshot queries = await posts.get();
    // for (var element in queries.docs) {
    //   List<dynamic> comments = element.data()['comments'] as List<dynamic>? ?? [];
    // }
  }
}
