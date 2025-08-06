import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
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

  final GetAllQuestionsUseCase _getAllQuestionsUseCase;
  getAllQuestions({required ExamEntity exam}) async {
    emit(QuestionLoading());
    final response = await _getAllQuestionsUseCase.call(exam.id);
    response.fold(
      (l) {
        allQuestion = l;
        emit(QuestionSuccess());
        // examEntity = exam;
        // startTimer(time: exam.duration);
      },
      (r) {
        emit(QuestionFailure(errorMessage: r.errorMessage));
      },
    );
  }

  void nextQuestion() {
    final isLastQuestion = currentPage >= allQuestion.length - 1;

    if (isLastQuestion) {
      // _timer.cancel();
      // checkQuestionResult();
      return;
    }
    currentPage += 1;
    pageController.jumpToPage(currentPage);
    emit(QuestionInitial());
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
