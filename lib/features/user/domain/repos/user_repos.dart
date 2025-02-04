import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepos {
  Future<Either<Failures, UserEntitiy>> getUserInfo();

  Future<Either<Failures, List<UserPostEntity>>> getUserPosts();
  Future<Either<Failures, void>> addComment(
      {required UserCommentEntity userComment, required String docId});
  Future<Either<Failures, List<UserCommentEntity>>> getPostComments(
      {required String docId});

  Future<Either<Failures, void>> editProfile({required UserEntitiy userEntity,required String docId});
}
