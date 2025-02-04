import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/user/data/repos_imple/user_repos_imple.dart';
import 'package:arapface1/features/user/domain/usecases/add_comment_usecase.dart';
import 'package:arapface1/features/user/domain/usecases/get_post_comments_usecse.dart';
import 'package:arapface1/features/user/presentation/cubits/add_comment_cubit/add_comment_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_post_comments_cubit/get_post_comments_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comment_form.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comments_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentModelSheetBody extends StatelessWidget {
  const CommentModelSheetBody({
    super.key,
    required this.postId,
  });
  final String postId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddCommentCubit(
              AddCommentUsecase(userRepos: getIt.get<UserReposImple>())),
        ),
        BlocProvider(
          create: (context) => GetPostCommentsCubit(
              GetPostCommentsUsecse(userRepos: getIt.get<UserReposImple>())),
        ),
      ],
      child: Column(
        children: [
          Expanded(
            child: CommentsListViewBuilder(docId: postId),
          ),
          const SizedBox(
            height: 5,
          ),
          CommentForm(
            postId: postId,
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }
}
