import 'package:arapface1/features/user/domain/entities/user_comment_entity.dart';
import 'package:arapface1/features/user/domain/usecases/get_post_comments_usecse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_post_comments_state.dart';

class GetPostCommentsCubit extends Cubit<GetPostCommentsState> {
  GetPostCommentsCubit(this.getPostCommentsUsecse)
      : super(GetPostCommentsInitial());
  final GetPostCommentsUsecse getPostCommentsUsecse;

  getPostComments({required String docId}) async {
    emit(GetPostCommentsLoading());
    var results = await getPostCommentsUsecse.call(docId: docId);
    results.fold((fail) {
      emit(GetPostCommentsFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(GetPostCommentsSuccess(comments: success));
    });
  }
}
