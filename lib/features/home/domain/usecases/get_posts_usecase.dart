import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/domain/repos/home_repos.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:dartz/dartz.dart';

class GetPostsUsecase {
  final HomeRepos homeRepos;

  GetPostsUsecase({required this.homeRepos});

  Future<Either<Failures, List<UserPostEntity>>> call() {
    return homeRepos.getPosts();
  }
}
