import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:dartz/dartz.dart';

abstract class AddUserRepos {
  Future<Either<Failures, void>> addUser({required UserEntitiy userentity});
}
