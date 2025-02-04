import 'package:arapface1/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:arapface1/features/auth/data/repos_imple/auth_repos_imple.dart';
import 'package:arapface1/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arapface1/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:arapface1/features/user/data/data_sources/get_user_info_remote_data_source.dart';
import 'package:arapface1/features/user/data/repos_imple/user_repos_imple.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthReposImple>(
    AuthReposImple(
      authRemoteDataSource: AuthRemoteDataSourceImple(),
    ),
  );
  getIt.registerSingleton<HomeReposImple>(
      HomeReposImple(homeRemoteDataSource: HomeRemoteDataSourceImple()));
  getIt.registerSingleton<UserReposImple>(UserReposImple(
      getUserInfoRemoteDataSource: GetUserInfoRemoteDataSourceImple()));

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}
