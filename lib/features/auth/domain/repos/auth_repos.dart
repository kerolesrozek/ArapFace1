import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepos {
  Future<Either<Failures, void>> register(
      {required UserAuthEntity userauthentity});

  Future<Either<Failures, void>> login(
      {required UserAuthEntity userauthentity});
}
