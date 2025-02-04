import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentsLoading extends StatelessWidget {
  const CommentsLoading({
    super.key,
    required this.itemCount,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemCount: itemCount,
         
          itemBuilder: (BuildContext context, int index) {
            return CommentWidget(
              userCommentEntity: UserCommentEntity(
                  comment: 'comment',
                  userImage: 'userImage',
                  userName: 'userName'),
            );
          },
        ),
      ),
    );
  }
}
