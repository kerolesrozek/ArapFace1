import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepos {
  Future<Either<Failures, void>> addPost({required UserPostEntity postEntity});
  Future<Either<Failures, List<UserPostEntity>>> getPosts();
  Future<Either<Failures, void>> addLike(
      {required UserLikeEntity userLikeEntity, required String docID});

  Future<Either<Failures, bool>> likeSubmitted({required String docID});

  Future<Either<Failures, List<UserLikeEntity>>> getLikes(
      {required String docID});
}
