part of 'add_post_cubit.dart';

sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostSuccess extends AddPostState {}

final class AddPostFailure extends AddPostState {
  final String errorMessage;

  AddPostFailure({required this.errorMessage});
}
