import 'package:arapface1/features/home/presentation/cubits/get_posts_cubit/get_posts_cubit.dart';
import 'package:arapface1/features/home/presentation/views/widgets/posts_list_view.dart';

import 'package:arapface1/features/user/presentation/views/widgets/user_post_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsListViewBuilder extends StatefulWidget {
  const PostsListViewBuilder({
    super.key,
  });

  @override
  State<PostsListViewBuilder> createState() => _PostsListViewBuilderState();
}

class _PostsListViewBuilderState extends State<PostsListViewBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPostsCubit>(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostsCubit, GetPostsState>(
      builder: (context, state) {
        if (state is GetPostsSuccess) {
          return PostsListView(
            userPosts: state.posts,
          );
        } else if (state is GetPostsFailure) {
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
