import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/use_cases/get_all_questions_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this._getAllQuestionsUseCase) : super(QuestionInitial());
  final PageController pageController = PageController();
  int currentPage = 0;
  List<QuestionsEntity> allQuestion = [];
  Map<String, AnswerSubmitRequestModel> question = {};

  final GetAllQuestionsUseCase _getAllQuestionsUseCase;
  getAllQuestions({required ExamEntity exam}) async {
    emit(QuestionLoading());
    final response = await _getAllQuestionsUseCase.call(exam.id);
    response.fold(
      (l) {
        allQuestion = l;
        emit(QuestionSuccess());
      },
      (r) {
        emit(QuestionFailure(errorMessage: r.errorMessage));
      },
    );
  }

  examFinish() {
    emit(QuestionFinishExam());
  }

  startExamAgain({required ExamEntity exam}) {
    currentPage = 0;
    question = {};
    getAllQuestions(exam: exam);
  }

  addNewAnswer({
    required AnswerSubmitRequestModel answer,
    required bool isSelected,
  }) {
    if (isSelected) {
      question[answer.questionId] = answer;
    } else {
      question.remove(answer.questionId);
    }
    emit(QuestionInitial());
  }

  void nextQuestion() {
    final isLastQuestion = currentPage >= allQuestion.length - 1;

    if (isLastQuestion) {
      emit(QuestionFinishExam());
      return;
    }
    currentPage += 1;
    pageController.jumpToPage(currentPage);
    emit(QuestionInitial());
  }

  void onPageChange(int value) {
    currentPage = value;
    if (currentPage != allQuestion.length) {
      emit(QuestionInitial());
    }
  }

  void backQuestion() {
    final isFirstQuestion = currentPage <= 0;
    if (!isFirstQuestion) {
      currentPage -= 1;
      pageController.jumpToPage(currentPage);
      emit(QuestionInitial());
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
