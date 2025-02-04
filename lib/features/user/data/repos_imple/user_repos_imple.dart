import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/add_user/data/data_sources/add_user_remote_data_source.dart';
import 'package:arapface1/features/user/data/data_sources/get_user_info_remote_data_source.dart';
import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:arapface1/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class UserReposImple extends UserRepos {
  final GetUserInfoRemoteDataSource getUserInfoRemoteDataSource;

  UserReposImple({required this.getUserInfoRemoteDataSource});
  @override
  Future<Either<Failures, UserEntitiy>> getUserInfo() async {
    try {
      return right(await getUserInfoRemoteDataSource.getUserInfo());
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<UserPostEntity>>> getUserPosts() async {
    try {
      return right(await getUserInfoRemoteDataSource.getUserPosts());
    } catch (e) {
      return left(
        Failures(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> addComment(
      {required UserCommentEntity userComment, required String docId}) async {
    try {
      return right(getUserInfoRemoteDataSource.addComment(
          userComment: userComment, docId: docId));
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<UserCommentEntity>>> getPostComments(
      {required String docId}) async {
    try {
      return right(
          await getUserInfoRemoteDataSource.getPostComments(docId: docId));
    } catch (e) {
      return left(
        Failures(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> editProfile(
      {required UserEntitiy userEntity, required String docId}) async {
    try {
      return right(await getUserInfoRemoteDataSource.editProfile(
          userEntity: userEntity, docId: docId));
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
