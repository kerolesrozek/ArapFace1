import 'package:arapface1/features/home/domain/usecases/like_submitted_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'like_submitted_state.dart';

class LikeSubmittedCubit extends Cubit<LikeSubmittedState> {
  LikeSubmittedCubit(this.likeSubmittedUsecase) : super(LikeSubmittedInitial());
  final LikeSubmittedUsecase likeSubmittedUsecase;

  likeSubmitted({required String docID}) async {
    var results = await likeSubmittedUsecase.call(docID: docID);
    results.fold((faile) {
      emit(LikeSubmittedFaile(errorMessage: faile.errorMessage));
    }, (success) {
      emit(LikeSubmittedSucces(submitted: success));
    });
  }
}
