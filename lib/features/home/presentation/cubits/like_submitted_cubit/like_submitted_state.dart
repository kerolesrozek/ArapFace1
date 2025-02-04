part of 'like_submitted_cubit.dart';

sealed class LikeSubmittedState {}

final class LikeSubmittedInitial extends LikeSubmittedState {}

final class LikeSubmittedSucces extends LikeSubmittedState {
  final bool submitted;

  LikeSubmittedSucces({required this.submitted});
}

final class LikeSubmittedFaile extends LikeSubmittedState {
  final String errorMessage;

  LikeSubmittedFaile({required this.errorMessage});
}
