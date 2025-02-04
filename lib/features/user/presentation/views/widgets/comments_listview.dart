
import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comment_widget.dart';
import 'package:flutter/material.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    required this.comments,
  });
  final List<UserCommentEntity> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (BuildContext context, int index) {
        return CommentWidget(
          userCommentEntity: comments[index],
        );
      },
    );
  }
}
