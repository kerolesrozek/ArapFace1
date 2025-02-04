import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:arapface1/features/user/domain/usecases/get_user_posts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetUserPostsCubit(this.getUserPostsUsecase) : super(GetUserPostsInitial());
  final GetUserPostsUsecase getUserPostsUsecase;

  getUserPosts() async {
    emit(GetUserPostsLoading());
    var results = await getUserPostsUsecase.call();

    results.fold((fail) {
      emit(
        GetUserPostsFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(
        GetUserPostsSuccess(
          userPosts: success,
        ),
      );
    });
  }
}
