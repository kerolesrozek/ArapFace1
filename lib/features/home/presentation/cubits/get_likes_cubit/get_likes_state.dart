part of 'get_likes_cubit.dart';

sealed class GetLikesState {}

final class GetLikesInitial extends GetLikesState {}

final class GetLikesLoading extends GetLikesState {}

final class GetLikesSuccess extends GetLikesState {
  final List<UserLikeEntity> likes;

  GetLikesSuccess({required this.likes});
}

final class GetLikesFailure extends GetLikesState {
  final String errorMessage;

  GetLikesFailure({required this.errorMessage});
}
