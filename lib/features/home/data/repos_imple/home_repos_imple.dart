import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/home/domain/repos/home_repos.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:dartz/dartz.dart';

class HomeReposImple extends HomeRepos {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeReposImple({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, void>> addPost(
      {required UserPostEntity postEntity}) async {
    try {
      return right(await homeRemoteDataSource.addPost(postEntity: postEntity));
    } catch (e) {
      return left(
        Failures(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<UserPostEntity>>> getPosts() async {
    try {
      return right(await homeRemoteDataSource.getPosts());
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> addLike(
      {required UserLikeEntity userLikeEntity, required String docID}) async {
    try {
      return right(await homeRemoteDataSource.addLike(
          userLikeEntity: userLikeEntity, docID: docID));
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> likeSubmitted({required String docID}) async {
    try {
      return right(await homeRemoteDataSource.likeSubmitted(docID: docID));
    } catch (e) {
     
      return left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<UserLikeEntity>>> getLikes(
      {required String docID}) async {
    try {
      return right(await homeRemoteDataSource.getLikes(docID: docID));
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
