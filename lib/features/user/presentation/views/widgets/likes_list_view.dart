
import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/user/presentation/views/widgets/like_widget.dart';
import 'package:flutter/material.dart';

class LiskesListView extends StatelessWidget {
  const LiskesListView({
    super.key,
    required this.likes,
  });
  final List<UserLikeEntity> likes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: likes.length,
        itemBuilder: (context, index) {
          return LikeWidget(
            userLikeEntity: likes[index],
          );
        });
  }
}
