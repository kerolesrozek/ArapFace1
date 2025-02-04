import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:arapface1/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class GetUserPostsUsecase {
  final UserRepos userRepos;

  GetUserPostsUsecase({required this.userRepos});
  Future<Either<Failures, List<UserPostEntity>>> call() {
    return userRepos.getUserPosts();
  }
}
