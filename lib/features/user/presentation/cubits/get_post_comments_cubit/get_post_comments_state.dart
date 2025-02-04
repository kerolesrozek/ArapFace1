part of 'get_post_comments_cubit.dart';

sealed class GetPostCommentsState {}

final class GetPostCommentsInitial extends GetPostCommentsState {}

final class GetPostCommentsLoading extends GetPostCommentsState {}

final class GetPostCommentsSuccess extends GetPostCommentsState {
  final List<UserCommentEntity> comments;

  GetPostCommentsSuccess({required this.comments});
}

final class GetPostCommentsFailure extends GetPostCommentsState {
  final String errorMessage;

  GetPostCommentsFailure({required this.errorMessage});
}
