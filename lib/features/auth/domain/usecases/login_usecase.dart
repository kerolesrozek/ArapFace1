import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:arapface1/features/auth/domain/repos/auth_repos.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepos authRepos;

  LoginUsecase({required this.authRepos});

  Future<Either<Failures, void>> call(
      {required UserAuthEntity userauthentity}) {
    return authRepos.login(userauthentity: userauthentity);
  }
}
