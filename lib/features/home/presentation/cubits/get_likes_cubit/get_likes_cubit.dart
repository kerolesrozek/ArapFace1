import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/home/domain/usecases/get_likes_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_likes_state.dart';

class GetLikesCubit extends Cubit<GetLikesState> {
  GetLikesCubit(this.getLikesUsecase) : super(GetLikesInitial());
  final GetLikesUsecase getLikesUsecase;

  getLikes({required String docID}) async {
    emit(GetLikesLoading());
    var results = await getLikesUsecase.call(docID: docID);
    results.fold((fail) {
      emit(GetLikesFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(GetLikesSuccess(likes: success));
    });
  }
}
