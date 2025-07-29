import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/use_case/exams_use_case.dart';
import 'package:injectable/injectable.dart';

part 'fetch_exam_all_by_id_state.dart';

@injectable
class FetchExamAllByIdCubit extends Cubit<FetchExamAllByIdBaseState> {
  FetchExamAllByIdCubit(this.allExamsByIdUseCase)
    : super(FetchExamAllByIdBaseState());
  final AllExamsByIdUseCase allExamsByIdUseCase;
  getAllExamsOnSubject({required String subjectId}) async {
    log(subjectId);
    emit(state.copyWith(baseState: BaseState(isLoading: true)));
    final response = await allExamsByIdUseCase.execute(subjectId);
    log(subjectId);
    response.fold(
      (r) => emit(
        state.copyWith(baseState: BaseState(errorMessage: r.errorMessage)),
      ),
      (l) => emit(state.copyWith(baseState: BaseState(data: l))),
    );
  }
}
