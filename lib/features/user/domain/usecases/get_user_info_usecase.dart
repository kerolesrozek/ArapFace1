import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class GetUserInfoUsecase {
  final UserRepos userRepos;

  GetUserInfoUsecase({required this.userRepos});
  Future<Either<Failures, UserEntitiy>> call() {
    return userRepos.getUserInfo();
  }
}
