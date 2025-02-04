import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.userCommentEntity,
  });

  final UserCommentEntity userCommentEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userCommentEntity.userName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    userCommentEntity.comment,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                )
              ],
            ),
          ),
          // Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(userCommentEntity.userImage),
          )
        ],
      ),
    );
  }
}
