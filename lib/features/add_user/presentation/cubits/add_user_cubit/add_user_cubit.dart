import 'package:arapface1/features/add_user/domain/usecases/add_user_usecase.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this.addUserUsecase) : super(AddUserInitial());
  final AddUserUsecase addUserUsecase;

  addUser({required UserEntitiy userentity}) async {
    var results = await addUserUsecase.call(userentity: userentity);
    results.fold((fail) {
      emit(
        AddUserFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(
        AddUserSuccess(),
      );
    });
  }
}
