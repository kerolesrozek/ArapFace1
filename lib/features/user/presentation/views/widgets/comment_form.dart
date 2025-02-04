import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/presentation/cubits/add_comment_cubit/add_comment_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_post_comments_cubit/get_post_comments_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:arapface1/features/user/presentation/views/widgets/comment_custtom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({
    super.key,
    required this.postId,
  });
  final String postId;

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController commentController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String comment;

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocBuilder<AddCommentCubit, AddCommentState>(
        builder: (context, state) {
          return CommentCusttomTextField(
            autovalidateMode: autovalidateMode,
            controller: commentController,
            onSaved: (p0) {
              comment = p0!;
            },
            isLoading: state is AddCommentSuccess || state is AddCommentInitial
                ? false
                : true,
            suffixIcon: IconButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await BlocProvider.of<AddCommentCubit>(context).addComment(
                        userComment: UserCommentEntity(
                            comment: comment,
                            userImage:
                                BlocProvider.of<GetUserInfoCubit>(context)
                                    .userEntitiy!
                                    .userImage,
                            userName: BlocProvider.of<GetUserInfoCubit>(context)
                                .userEntitiy!
                                .userName),
                        docId: widget.postId);
                    Future.delayed(
                        const Duration(
                          seconds: 1,
                        ), () {
                      BlocProvider.of<GetPostCommentsCubit>(context)
                          .getPostComments(docId: widget.postId);
                    });

                    commentController.clear();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                icon: const Icon(Icons.send)),
          );
        },
      ),
    );
  }
}
