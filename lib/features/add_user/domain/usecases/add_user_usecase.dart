import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/add_user/domain/repos/add_user_repos.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:dartz/dartz.dart';

class AddUserUsecase {
  final AddUserRepos addUserRepos;

  AddUserUsecase({required this.addUserRepos});
  Future<Either<Failures, void>> call({required UserEntitiy userentity}) {
    return addUserRepos.addUser(userentity: userentity);
  }
}
