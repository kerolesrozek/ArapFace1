import 'package:arapface1/features/home/domain/usecases/add_post_usecase.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this.addPostUsecase) : super(AddPostInitial());

  final AddPostUsecase addPostUsecase;

  addPost({required UserPostEntity postEntity}) async {
    emit(AddPostLoading());
    var results = await addPostUsecase.call(postEntity: postEntity);
    results.fold((fail) {
      emit(AddPostFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(AddPostSuccess());
    });
  }
}
