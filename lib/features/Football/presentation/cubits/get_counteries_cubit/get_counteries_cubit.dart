// import 'package:arapface1/features/Football/domain/entities/countery_entity.dart';
// import 'package:arapface1/features/Football/domain/usecases/get_counteries_usecase.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'get_counteries_state.dart';

// class GetCounteriesCubit extends Cubit<GetCounteriesState> {
//   GetCounteriesCubit(this.getCounteriesUsecase) : super(GetCounteriesInitial());

//   final GetCounteriesUsecase getCounteriesUsecase;

//   getCounteries({
//     Map<String, dynamic>? queryParams,
//   }) async {
//     emit(GetCounteriesLoading());
//     var results = await getCounteriesUsecase.call(queryParams: queryParams);
//     results.fold((fail) {
//       emit(GetCounteriesFailure(errorMessage: fail.errorMessage));
//     }, (success) {
//       emit(GetCounteriesSuccess(counteries: success));
//     });
//   }
// }
