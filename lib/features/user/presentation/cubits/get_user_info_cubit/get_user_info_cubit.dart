import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/usecases/get_user_info_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit(this.getUserInfoUsecase) : super(GetUserInfoInitial());

  final GetUserInfoUsecase getUserInfoUsecase;

  UserEntitiy? userEntitiy;

  getUserInfo() async {
    emit(GetUserInfoLoading());

    var results = await getUserInfoUsecase.call();
    results.fold((fail) {
      emit(GetUserInfoFailure(errormessage: fail.errorMessage));
    }, (success) {
      userEntitiy = success;
      emit(GetUserInfoSuccess(userEntitiy: success));
    });
  }
}
