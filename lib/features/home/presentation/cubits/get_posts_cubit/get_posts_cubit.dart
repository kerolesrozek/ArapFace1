import 'package:arapface1/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit(this.getPostsUsecase) : super(GetPostsInitial());

  final GetPostsUsecase getPostsUsecase;

  getPosts() async {
    emit(GetPostsLoading());
    var results = await getPostsUsecase.call();
    results.fold((fail) {
      emit(
        GetPostsFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(GetPostsSuccess(posts: success));
    });
  }
}
