import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/home/domain/repos/home_repos.dart';
import 'package:dartz/dartz.dart';

class GetLikesUsecase {
  final HomeRepos homeRepos;

  GetLikesUsecase({required this.homeRepos});

 Future<Either<Failures, List<UserLikeEntity>>> call({required String docID})async {
  return  homeRepos.getLikes(docID: docID);
  }
}
