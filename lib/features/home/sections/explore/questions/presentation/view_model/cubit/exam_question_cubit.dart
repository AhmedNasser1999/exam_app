import 'dart:async';
import 'dart:developer';

import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/use_cases/get_all_questions_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'exam_question_state.dart';

@injectable
class ExamQuestionCubit extends Cubit<ExamQuestionState> {
  ExamQuestionCubit(this._getAllQuestionsUseCase)
    : super(ExamQuestionInitial());
  final GetAllQuestionsUseCase _getAllQuestionsUseCase;
  final PageController pageController = PageController();
  late Timer timer;
  Duration timeLeft = const Duration(minutes: 1);
  bool isSelectedQuestion = false;
  List<QuestionsEntity> allQuestion = [];
  int currentPage = 0;
  List<String> questionAnswerCorrect = [];
  List<String> choseAnswer = [];
  getAllQuestions({required String examId}) async {
    emit(ExamQuestionLoading());
    final response = await _getAllQuestionsUseCase.call(examId);
    response.fold(
      (l) {
        _addCorrectAnswer(question: l);
        startTimer();
        allQuestion = l;
        emit(ExamQuestionSuccess());
      },
      (r) {
        emit(ExamQuestionFailure(errorMessage: r.errorMessage));
      },
    );
  }

  addChoseAnswer({required String answer}) {
    log(choseAnswer.length.toString());
  }

  void selectedQuestion() {
    isSelectedQuestion = isSelectedQuestion == false ? true : false;
    emit(ExamQuestionInitial());
  }

  _addCorrectAnswer({required List<QuestionsEntity> question}) {
    for (var element in question) {
      questionAnswerCorrect.add(element.correctAnswerKey);
    }
  }

  void onPageChange(int value) {
    currentPage = value;
    if (currentPage != questionAnswerCorrect.length) {
      emit(ExamQuestionInitial());
    }
  }

  nextQuestion() {
    if (currentPage == questionAnswerCorrect.length) {
      showScore();
      timer.cancel();
      currentPage = questionAnswerCorrect.length - 1;
    }
    pageController.jumpToPage(currentPage += 1);
    if (currentPage != questionAnswerCorrect.length) {
      emit(ExamQuestionInitial());
    }
  }

  backQuestion() {
    if (currentPage <= 0) {
      currentPage = 0;
    } else {
      pageController.jumpToPage(currentPage -= 1);
    }
    emit(ExamQuestionInitial());
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.inSeconds == 0) {
        showScore();
        timer.cancel();
      } else {
        timeLeft -= const Duration(seconds: 1);
        emit(ExamQuestionInitial());
      }
    });
  }

  showScore() {
    emit(ExamQuestionScore());
    log("score ---------------------");
  }

  startExamAgain() {
    currentPage = 0;
    startTimer();
    emit(ExamQuestionSuccess());
    log("score ---------------------");
  }

  @override
  Future<void> close() {
    timer.cancel();
    pageController.dispose();
    return super.close();
  }
}
