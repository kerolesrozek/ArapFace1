// import 'package:arapface1/core/api_services.dart';
// import 'package:arapface1/features/Football/data/data_sources/football_remote_data_source.dart';
// import 'package:arapface1/features/Football/data/repos_imple/football_repos_imple.dart';
// import 'package:arapface1/features/Football/domain/usecases/get_counteries_usecase.dart';
// import 'package:arapface1/features/Football/presentation/cubits/get_counteries_cubit/get_counteries_cubit.dart';
// import 'package:arapface1/features/Football/presentation/views/widgets/football_view_body.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FootBallView extends StatelessWidget {
//   const FootBallView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetCounteriesCubit(GetCounteriesUsecase(
//           footballRepos: FootballReposImple(
//               footballRemoteDataSource: FootballRemoteDataSourceImple(
//                   apiServices: ApiServices(dio: Dio()))))),
//       child: const Scaffold(
//         body: SafeArea(child: FootBallViewBody()),
//       ),
//     );
//   }
// }
