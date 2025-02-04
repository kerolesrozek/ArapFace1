import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:arapface1/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());
  final RegisterUsecase registerUsecase;

  register({required UserAuthEntity userauthentity}) async {
    emit(
      RegisterLoading(),
    );
    var results = await registerUsecase.call(userauthentity: userauthentity);
    results.fold((fail) {
      emit(
        RegisterFailure(errorMessage: fail.errorMessage),
      );
    }, (success) {
      emit(
        RegisterSuccess(),
      );
    });
  }
}
