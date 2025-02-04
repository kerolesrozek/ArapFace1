import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/home/domain/repos/home_repos.dart';
import 'package:dartz/dartz.dart';

class AddLikeUsecase {
  final HomeRepos homeRepos;

  AddLikeUsecase({required this.homeRepos});

 Future<Either<Failures, void>> call({required UserLikeEntity userLikeEntity,required String docID})async {
  return await  homeRepos.addLike(userLikeEntity: userLikeEntity,docID: docID, );
  }
}
