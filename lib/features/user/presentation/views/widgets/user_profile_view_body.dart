import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_info_builder.dart';
import 'package:arapface1/features/user/presentation/views/widgets/user_post_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileViewBody extends StatefulWidget {
  const UserProfileViewBody({
    super.key,
  });

  @override
  State<UserProfileViewBody> createState() => _UserProfileViewBodyState();
}

class _UserProfileViewBodyState extends State<UserProfileViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
    BlocProvider.of<GetUserPostsCubit>(context).getUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(2.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          UserInfoBuilder(),
          UserPostsListView(),
        ],
      ),
    );
  }
}
