import 'package:arapface1/features/home/presentation/views/widgets/add_post.dart';
import 'package:arapface1/features/home/presentation/views/widgets/posts_list_view_builder.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: AddPost(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          PostsListViewBuilder()
        ],
      ),
    );
  }
}
