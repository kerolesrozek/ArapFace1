import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AddUserRemoteDataSource {
  Future<void> addUser({required UserEntitiy userentity});
}

class AddUserRemoteDataSourceImple extends AddUserRemoteDataSource {
  @override
  Future<void> addUser({required UserEntitiy userentity}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    DocumentReference doc = await users.add({
      'userId': userentity.userId,
      'bio': userentity.bio,
      'userImage': userentity.userImage,
      'userName': userentity.userName,
      'docId': userentity.docId,
    });

   await doc.update({
      'docId': doc.id,
    });
  }
}
