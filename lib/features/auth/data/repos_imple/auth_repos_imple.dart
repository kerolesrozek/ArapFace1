import 'package:arapface1/core/failures.dart';
import 'package:arapface1/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:arapface1/features/auth/domain/repos/auth_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthReposImple extends AuthRepos {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthReposImple({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, void>> register(
      {required UserAuthEntity userauthentity}) async {
    try {
      return right(
          await authRemoteDataSource.rgister(userauthentity: userauthentity));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
            Failures(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(Failures(
            errorMessage: 'The account already exists for that email.'));
      } else {
        return left(
          Failures(
            errorMessage: e.toString(),
          ),
        );
      }
    } catch (e) {
      return left(Failures(
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failures, void>> login(
      {required UserAuthEntity userauthentity}) async {
    try {
      return right(
          await authRemoteDataSource.login(userauthentity: userauthentity));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(Failures(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return left(
            Failures(errorMessage: 'Wrong password provided for that user.'));
      } else {
        return left(
          Failures(
            errorMessage: e.toString(),
          ),
        );
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
