import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/add_user/data/data_sources/add_user_remote_data_source.dart';
import 'package:arapface1/features/add_user/domain/repos/add_user_repos.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:dartz/dartz.dart';

class AddUserReposImple extends AddUserRepos {
  final AddUserRemoteDataSource addUserRemoteDataSource;

  AddUserReposImple({required this.addUserRemoteDataSource});
  @override
  Future<Either<Failures, void>> addUser(
      {required UserEntitiy userentity}) async {
    try {
      return right(
          await addUserRemoteDataSource.addUser(userentity: userentity));
    } catch (e) {
      return left(
        Failures(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
