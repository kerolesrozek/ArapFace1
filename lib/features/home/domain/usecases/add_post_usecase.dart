import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/domain/repos/home_repos.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:dartz/dartz.dart';

class AddPostUsecase {
  final HomeRepos homeRepos;

  AddPostUsecase({required this.homeRepos});

  Future<Either<Failures, void>> call({required UserPostEntity postEntity}) {
    return homeRepos.addPost(postEntity: postEntity);
  }
}
