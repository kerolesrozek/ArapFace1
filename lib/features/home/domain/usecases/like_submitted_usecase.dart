import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/home/domain/repos/home_repos.dart';
import 'package:dartz/dartz.dart';

class LikeSubmittedUsecase {
  final HomeRepos homeRepos;

  LikeSubmittedUsecase({required this.homeRepos});

 Future<Either<Failures, bool>> call({required String docID}) async{
   return  homeRepos.likeSubmitted(docID: docID);
  }
}
