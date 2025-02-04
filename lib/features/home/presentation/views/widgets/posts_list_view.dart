import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:arapface1/features/home/domain/usecases/add_like_usecase.dart';
import 'package:arapface1/features/home/presentation/cubits/add_like_cubit/add_like_cubit.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
    required this.userPosts,
  });
  final List<UserPostEntity> userPosts;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: userPosts.length,
        itemBuilder: (context, index) {
          return BlocProvider(
            create: (context) => AddLikeCubit(
                AddLikeUsecase(homeRepos: getIt.get<HomeReposImple>())),
            child: PostWidget(
                // isSubmitted: false,/////////////////
                userPostsEntity: userPosts[index]),
          );
        });
  }
}
