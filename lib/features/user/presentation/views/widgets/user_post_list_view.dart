import 'package:arapface1/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arapface1/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:arapface1/features/home/domain/usecases/add_like_usecase.dart';
import 'package:arapface1/features/home/presentation/cubits/add_like_cubit/add_like_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_post.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_post_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPostsListView extends StatelessWidget {
  const UserPostsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserPostsCubit, GetUserPostsState>(
      builder: (context, state) {
        if (state is GetUserPostsSuccess) {
          return SliverList.builder(
              itemCount: state.userPosts.length,
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (context) => AddLikeCubit(AddLikeUsecase(
                      homeRepos: HomeReposImple(
                          homeRemoteDataSource: HomeRemoteDataSourceImple()))),
                  child: PostWidget(
                    // onPressed: (){},
                    // isSubmitted: false,////////////////
                    userPostsEntity: state.userPosts[index],
                  ),
                );
              });
        } else if (state is GetUserPostsFailure) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else {
          return const SliverToBoxAdapter(
            child: UserPostsLoadingWidget(),
          );
        }
      },
    );
  }
}
