part of 'get_user_info_cubit.dart';

sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoFailure extends GetUserInfoState {
  final String errormessage;

  GetUserInfoFailure({required this.errormessage});
}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserEntitiy userEntitiy;

  GetUserInfoSuccess({required this.userEntitiy});
}
