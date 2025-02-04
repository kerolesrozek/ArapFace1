import 'dart:developer';

import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/usecases/add_comment_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.addCommentUsecase) : super(AddCommentInitial());
  final AddCommentUsecase addCommentUsecase;

  addComment(
      {required UserCommentEntity userComment, required String docId}) async {
    emit(AddCommentLoading());
    var results =
        await addCommentUsecase.call(userComment: userComment, docId: docId);
    results.fold((fail) {
      log(fail.errorMessage);
      emit(AddCommentFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(AddCommentSuccess());
    });
  }
}
