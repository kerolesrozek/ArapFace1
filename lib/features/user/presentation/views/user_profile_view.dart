import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/user/data/repos_imple/user_repos_imple.dart';
import 'package:arapface1/features/user/domain/usecases/get_user_posts_usecase.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserPostsCubit(GetUserPostsUsecase(
          userRepos: getIt.get<UserReposImple>())),
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: const SafeArea(
          child: UserProfileViewBody(),
        ),
      ),
    );
  }
}
