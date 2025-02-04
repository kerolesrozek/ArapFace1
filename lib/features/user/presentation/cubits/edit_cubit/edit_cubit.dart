import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit(this.editProfileUsecase) : super(EditInitial());
  final EditProfileUsecase editProfileUsecase;

  editUserInfo({required UserEntitiy userEntity, required String docId}) async {
    var results =
        await editProfileUsecase.call(userEntity: userEntity, docId: docId);
    results.fold((fail) {
      emit(EditFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(EditSuccss());
    });
  }
}
