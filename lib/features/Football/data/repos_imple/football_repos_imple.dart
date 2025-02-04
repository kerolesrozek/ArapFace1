// import 'package:arapface1/core/failures.dart';
// import 'package:arapface1/features/Football/data/data_sources/football_remote_data_source.dart';
// import 'package:arapface1/features/Football/domain/entities/countery_entity.dart';
// import 'package:arapface1/features/Football/domain/repos/football_repos.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class FootballReposImple extends FootballRepos {
//   final FootballRemoteDataSource footballRemoteDataSource;

//   FootballReposImple({required this.footballRemoteDataSource});
//   @override
//   Future<Either<Failures, List<CounteryEntity>>> getCounteries({Map<String, dynamic>? queryParams,}) async {
//     try {
//       return right(await footballRemoteDataSource.getCounteries(queryParams: queryParams));
//     } on DioException catch (e) {
//       return left(ApiServerEror(errorMessage: e.toString()));
//     } catch (e) {
//       return left(Failures(errorMessage: e.toString()));
//     }
//   }
// }
