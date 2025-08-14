import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/base_state/base_state.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/use_case/exams_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'fetch_exam_all_by_id_state.dart';

@injectable
class FetchExamAllByIdCubit extends Cubit<FetchExamAllByIdBaseState> {
  FetchExamAllByIdCubit(this.allExamsByIdUseCase)
    : super(FetchExamAllByIdBaseState());
  final AllExamsByIdUseCase allExamsByIdUseCase;
  getAllExamsOnSubject({required String subjectId}) async {
    emit(state.copyWith(baseState: AllExamBaseState(isLoading: true)));
    final response = await allExamsByIdUseCase.call(subjectId);
    switch (response) {
      case SuccessApiResult<List<ExamEntity>>():
        emit(
          state.copyWith(baseState: AllExamBaseState(allExams: response.data)),
        );
      case FailureApiResult<List<ExamEntity>>():
        emit(
          state.copyWith(
            baseState: AllExamBaseState(error: response.error.errorMessage),
          ),
        );
    }
  }

  startExam({required examEntity}) {
    emit(
      state.copyWith(
        baseState: AllExamBaseState(startExam: true, selectExam: examEntity),
      ),
    );
  }
}
