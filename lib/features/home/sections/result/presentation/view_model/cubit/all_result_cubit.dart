import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
import 'package:exam_app/features/home/sections/result/domain/use_case/get_all_result_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'all_result_state.dart';

@injectable
class AllResultCubit extends Cubit<AllResultState> {
  AllResultCubit(this._getAllResultUseCase) : super(AllResultInitial());
  final GetAllResultUseCase _getAllResultUseCase;
  List<ExamInfoModel> examInfoModel = [];
  getAllResult() async {
    emit(AllResultLoading());
    final allResult = await _getAllResultUseCase.call();
    allResult.fold(
      (l) {
        emit(AllResultSuccess(examsResult: l));
      },
      (r) {
        emit(AllResultFailure(errorMessage: r.errorMessage));
      },
    );
  }
}
