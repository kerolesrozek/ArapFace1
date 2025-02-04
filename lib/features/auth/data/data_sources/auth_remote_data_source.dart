import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<void> rgister({required UserAuthEntity userauthentity});

  Future<void> login({required UserAuthEntity userauthentity});
}

class AuthRemoteDataSourceImple extends AuthRemoteDataSource {
  @override
  Future<void> rgister({required UserAuthEntity userauthentity}) async {
   
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userauthentity.email,
      password: userauthentity.password,
    );
  }

  @override
  Future<void> login({required UserAuthEntity userauthentity}) async {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userauthentity.email,
      password: userauthentity.password,
    );
  }
}
