import 'package:arapface1/features/auth/domain/entities/user_auth_entity.dart';
import 'package:arapface1/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUsecase) : super(LoginInitial());
  final LoginUsecase loginUsecase;

  login({required UserAuthEntity userauthentity}) async {
    emit(
      LoginLoading(),
    );
    var results = await loginUsecase.call(userauthentity: userauthentity);
    results.fold((fail) {
      emit(
        LoginFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(
        LoginSuccess(),
      );
    });
  }
}
