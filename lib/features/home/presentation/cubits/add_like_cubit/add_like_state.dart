part of 'add_like_cubit.dart';

sealed class AddLikeState {}

final class AddLikeInitial extends AddLikeState {}

final class AddLikeLoading extends AddLikeState {}

final class AddLikeSuccess extends AddLikeState {
  final bool isSubmited;

  AddLikeSuccess({required this.isSubmited});
}

final class AddLikeFailure extends AddLikeState {
  final String errorMessage;

  AddLikeFailure({required this.errorMessage});
}
