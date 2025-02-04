part of 'get_posts_cubit.dart';

sealed class GetPostsState {}

final class GetPostsInitial extends GetPostsState {}

final class GetPostsLoading extends GetPostsState {}

final class GetPostsSuccess extends GetPostsState {
  final List<UserPostEntity> posts;

  GetPostsSuccess({required this.posts});
}

final class GetPostsFailure extends GetPostsState {
  final String errorMessage;

  GetPostsFailure({required this.errorMessage});
}
