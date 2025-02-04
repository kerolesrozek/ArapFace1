import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeRemoteDataSource {
  Future<void> addPost({required UserPostEntity postEntity});
  Future<List<UserPostEntity>> getPosts();
  Future<void> addLike({
    required UserLikeEntity userLikeEntity,
    required String docID,
  });
  Future<bool> likeSubmitted({required String docID});

  Future<List<UserLikeEntity>> getLikes({required String docID});
}

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  @override
  Future<void> addPost({required UserPostEntity postEntity}) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    DocumentReference docRef = await posts.add({
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'docId': postEntity.docummentId,
      'postImage': postEntity.postImage,
      'postContent': postEntity.postContent,
      'comments': postEntity.comments,
      'likes': postEntity.likes,
      'userName': postEntity.userName,
      'time': postEntity.time,
      'userImage': postEntity.userImage
    });

    await docRef.update({
      'docId': docRef.id,
    });
  }

  @override
  Future<List<UserPostEntity>> getPosts() async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    QuerySnapshot querySnapshot = await posts.get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    List<UserPostEntity> postsList = [];
    for (var element in docs) {
      postsList.add(UserPostEntity(
          comments: element['comments'],
          id: element['docId'],
          postImage: element['postImage'],
          postContent: element['postContent'],
          time: element['time'],
          userImage: element['userImage'],
          userName: element['userName'],
          docummentId: element['docId'],
          likes: element['likes']));
    }
    return postsList;
  }

  @override
  Future<void> addLike({
    required UserLikeEntity userLikeEntity,
    required String docID,
  }) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    DocumentSnapshot documentSnapshot = await posts.doc(docID).get();
    List<dynamic> likes = documentSnapshot['likes'];
    if (likes.isEmpty) {
      likes.add({
        'userImage': userLikeEntity.userImage,
        'userNmae': userLikeEntity.userName,
        'userId': userLikeEntity.userId,
        'isSubmited': userLikeEntity.isSubmited,
      });
      await posts.doc(docID).update({'likes': likes});
      return;
    } else if (likes.isNotEmpty) {
      for (int index = 0; index < likes.length; index++) {
        if (likes[index]['userId'] == FirebaseAuth.instance.currentUser!.uid) {
          likes.removeAt(index);
          await posts.doc(docID).update({'likes': likes});
          return;
        }
      }
    }
    likes.add({
      'userImage': userLikeEntity.userImage,
      'userNmae': userLikeEntity.userName,
      'userId': userLikeEntity.userId,
      'isSubmited': userLikeEntity.isSubmited,
    });
    await posts.doc(docID).update({'likes': likes});
  }

  @override
  Future<bool> likeSubmitted({required String docID}) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    DocumentSnapshot documentSnapshot = await posts.doc(docID).get();
    for (var element in documentSnapshot['likes']) {
      if (element['userId'] == FirebaseAuth.instance.currentUser!.uid) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<List<UserLikeEntity>> getLikes({required String docID}) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    DocumentSnapshot documentSnapshot = await posts.doc(docID).get();
    List<UserLikeEntity> likes = [];
    for (var element in documentSnapshot['likes']) {
      likes.add(UserLikeEntity(
          isSubmited: element['isSubmited'],
          userImage: element['userImage'],
          userName: element['userNmae'],
          userId: element['userId']));
    }
    return likes;
  }
}
