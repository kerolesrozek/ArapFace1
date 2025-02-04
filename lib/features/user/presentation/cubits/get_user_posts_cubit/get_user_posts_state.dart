part of 'get_user_posts_cubit.dart';

sealed class GetUserPostsState {}

final class GetUserPostsInitial extends GetUserPostsState {}

final class GetUserPostsLoading extends GetUserPostsState {}

final class GetUserPostsSuccess extends GetUserPostsState {
  final List<UserPostEntity> userPosts;

  GetUserPostsSuccess({required this.userPosts});
}

final class GetUserPostsFailure extends GetUserPostsState {
  final String errorMessage;

  GetUserPostsFailure({required this.errorMessage});
}
