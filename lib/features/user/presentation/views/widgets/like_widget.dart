import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:flutter/material.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({
    super.key,
    required this.userLikeEntity,
  });
  final UserLikeEntity userLikeEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(userLikeEntity.userImage),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              userLikeEntity.userName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
