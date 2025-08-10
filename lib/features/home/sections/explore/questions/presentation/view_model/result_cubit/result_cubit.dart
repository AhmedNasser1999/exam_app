import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/use_cases/check_questions_on_exam_use_case.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/use_cases/save_exam_result_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  ResultCubit(this._checkQuestionsOnExamUseCase, this._saveExamResultUseCase)
    : super(ResultInitial());
  final CheckQuestionsOnExamUseCase _checkQuestionsOnExamUseCase;
  final SaveExamResultUseCase _saveExamResultUseCase;
  ResultEntity result = ResultEntity(
    correctAnswer: 0,
    inCorrectAnswer: 0,
    total: "",
  );
  Future<void> checkQuestionResult(
    Map<String, AnswerSubmitRequestModel> question,
  ) async {
    emit(ResultLoading());
    final response = await _checkQuestionsOnExamUseCase.call(question);
    response.fold(
      (l) {
        result = l;
        emit(ResultSuccess());
      },
      (r) {
        emit(ResultFailure(errorMessage: r.errorMessage));
      },
    );
  }

  saveQuestionsResult({required ExamInfoEntity examInfo}) async {
    final dataSaved = await _saveExamResultUseCase.call(examInfo);
    dataSaved.fold(
      (l) {
        log("success");
      },
      (r) {
        log(r.errorMessage);
      },
    );
  }
}
