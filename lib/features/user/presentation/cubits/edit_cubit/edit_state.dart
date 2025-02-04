part of 'edit_cubit.dart';

sealed class EditState {}

final class EditInitial extends EditState {}

final class EditLoading extends EditState {}

final class EditSuccss extends EditState {}

final class EditFailure extends EditState {
  final String errorMessage;

  EditFailure({required this.errorMessage});
}
