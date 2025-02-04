import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class GetPostCommentsUsecse {
  final UserRepos userRepos;

  GetPostCommentsUsecse({required this.userRepos});
  Future<Either<Failures, List<UserCommentEntity>>> call(
      {required String docId}) {
    return userRepos.getPostComments(docId: docId);
  }
}
