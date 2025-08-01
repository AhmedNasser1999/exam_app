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
    final response = await allExamsByIdUseCase.execute(subjectId);
    response.fold(
      (r) => emit(
        state.copyWith(baseState: AllExamBaseState(error: r.errorMessage)),
      ),
      (l) => emit(state.copyWith(baseState: AllExamBaseState(allExams: l))),
    );
  }

  startExam({required examEntity}) {
    emit(
      state.copyWith(
        baseState: AllExamBaseState(startExam: true, selectExam: examEntity),
      ),
    );
  }
}
