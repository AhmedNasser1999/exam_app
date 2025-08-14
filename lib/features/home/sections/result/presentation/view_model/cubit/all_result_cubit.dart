import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/result/domain/use_case/get_all_result_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'all_result_state.dart';

@injectable
class AllResultCubit extends Cubit<AllResultState> {
  AllResultCubit(this._getAllResultUseCase) : super(AllResultInitial());
  final GetAllResultUseCase _getAllResultUseCase;
  getAllResult() async {
    emit(AllResultLoading());
    final allResult = await _getAllResultUseCase.call();
    switch (allResult) {
      case SuccessApiResult<List<ExamInfoEntity>>():
        emit(AllResultSuccess(examsResult: allResult.data));
      case FailureApiResult<List<ExamInfoEntity>>():
        emit(AllResultFailure(errorMessage: allResult.error.errorMessage));
    }
  }
}
