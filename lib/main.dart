import 'package:arapface1/core/app_routes.dart';
import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/core/simple_bloc_observer.dart';
import 'package:arapface1/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:arapface1/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:arapface1/features/home/presentation/cubits/get_posts_cubit/get_posts_cubit.dart';
import 'package:arapface1/features/user/data/repos_imple/user_repos_imple.dart';
import 'package:arapface1/features/user/domain/usecases/get_user_info_usecase.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:arapface1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = SimpleBlocObserver();

  runApp(const ArapFace());
}

class ArapFace extends StatelessWidget {
  const ArapFace({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserInfoCubit(
              GetUserInfoUsecase(userRepos: getIt.get<UserReposImple>())),
        ),
        BlocProvider(
          create: (context) => GetPostsCubit(
              GetPostsUsecase(homeRepos: getIt.get<HomeReposImple>())),
        ),

        // BlocProvider(
        //   create: (context) => LikeSubmittedCubit(LikeSubmittedUsecase(
        //       homeRepos: HomeReposImple(
        //           homeRemoteDataSource: HomeRemoteDataSourceImple()))),
        // ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
