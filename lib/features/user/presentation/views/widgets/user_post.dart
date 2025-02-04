import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/home/presentation/cubits/add_like_cubit/add_like_cubit.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comment_modelsheet_body.dart';
import 'package:arapface1/features/user/presentation/views/widgets/show_likes.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.userPostsEntity,
  });

  final UserPostEntity userPostsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              userPostsEntity.userName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 31,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(userPostsEntity.userImage),
                onBackgroundImageError: (exception, stackTrace) =>
                    const Text('error'),
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              userPostsEntity.postContent,
              style: const TextStyle(
                fontSize: 22,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: userPostsEntity.postImage),
        ),
        ShowLikes(
          docId: userPostsEntity.docummentId,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                iconSize: 30,
                onPressed: () {
                  BlocProvider.of<AddLikeCubit>(context).addLike(
                      userLikeEntity: UserLikeEntity(
                          isSubmited: true,
                          userImage: BlocProvider.of<GetUserInfoCubit>(context)
                              .userEntitiy!
                              .userImage,
                          userName: BlocProvider.of<GetUserInfoCubit>(context)
                              .userEntitiy!
                              .userName,
                          userId: FirebaseAuth.instance.currentUser!.uid),
                      docID: userPostsEntity.id);
                },
                icon: const Icon(Icons.favorite)),
            IconButton(
              iconSize: 30,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: (context),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                        child: CommentModelSheetBody(
                          postId: userPostsEntity.docummentId,
                        ),
                      );
                    });
              },
              icon: const Icon(
                Icons.comment,
              ),
            ),
          ],
        ),
        const Divider(
          indent: 25,
          endIndent: 25,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
