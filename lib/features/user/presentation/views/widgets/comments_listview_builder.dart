import 'package:arapface1/features/user/presentation/cubits/get_post_comments_cubit/get_post_comments_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comments_listview.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comments_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsListViewBuilder extends StatefulWidget {
  const CommentsListViewBuilder({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  State<CommentsListViewBuilder> createState() =>
      _CommentsListViewBuilderState();
}

class _CommentsListViewBuilderState extends State<CommentsListViewBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPostCommentsCubit>(context)
        .getPostComments(docId: widget.docId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostCommentsCubit, GetPostCommentsState>(
      builder: (context, state) {
        if (state is GetPostCommentsSuccess) {
          return CommentsListView(
            comments: state.comments,
          );
        } else if (state is GetPostCommentsFailure) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else {
          return CommentsLoading(
            itemCount:
                state is GetPostCommentsSuccess ? state.comments.length : 0,
          );
        }
      },
    );
  }
}
