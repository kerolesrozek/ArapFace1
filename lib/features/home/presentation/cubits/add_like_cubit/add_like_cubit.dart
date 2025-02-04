import 'dart:developer';

import 'package:arapface1/features/home/domain/entities/user_like_entity.dart';
import 'package:arapface1/features/home/domain/usecases/add_like_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_like_state.dart';

class AddLikeCubit extends Cubit<AddLikeState> {
  AddLikeCubit(this.addLikeUsecase) : super(AddLikeInitial());

  final AddLikeUsecase addLikeUsecase;

  addLike({
    required UserLikeEntity userLikeEntity,
    required String docID,
  }) async {
    var results =
        await addLikeUsecase.call(userLikeEntity: userLikeEntity, docID: docID);

    results.fold((fail) {
      // userLikeEntity.isSubmited = false;
      log(fail.errorMessage);
      emit(AddLikeFailure(errorMessage: fail.errorMessage));
    }, (success) {
      // userLikeEntity.isSubmited = true;
      emit(AddLikeSuccess(isSubmited: true));
    });
  }
}
