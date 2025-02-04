import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class AddCommentUsecase {
  final UserRepos userRepos;

  AddCommentUsecase({required this.userRepos});
  Future<Either<Failures, void>> call(
      {required UserCommentEntity userComment, required String docId}) {
    return userRepos.addComment(userComment: userComment, docId: docId);
  }
}
