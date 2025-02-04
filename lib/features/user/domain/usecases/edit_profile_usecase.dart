import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/repos/user_repos.dart';
import 'package:dartz/dartz.dart';

class EditProfileUsecase {
  final UserRepos userRepos;

  EditProfileUsecase({required this.userRepos});

Future<Either<Failures, void>>  call({required UserEntitiy userEntity,required String docId}) async{
  return await  userRepos.editProfile(userEntity: userEntity,docId: docId);
  }
}
