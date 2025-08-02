import 'dart:async';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/use_cases/check_questions_on_exam_use_case.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/use_cases/get_all_questions_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'exam_question_state.dart';

@injectable
class ExamQuestionCubit extends Cubit<ExamQuestionState> {
  ExamQuestionCubit(
    this._getAllQuestionsUseCase,
    this._checkQuestionsOnExamUseCase,
  ) : super(ExamQuestionInitial());
  final GetAllQuestionsUseCase _getAllQuestionsUseCase;
  final CheckQuestionsOnExamUseCase _checkQuestionsOnExamUseCase;
  final PageController pageController = PageController();
  int currentPage = 0;
  late Timer _timer;
  Duration timeLeft = const Duration();
  Map<String, AnswerSubmitRequestModel> question = {};
  List<QuestionsEntity> allQuestion = [];
  ResultEntity result = ResultEntity(
    correctAnswer: 0,
    inCorrectAnswer: 0,
    total: "",
  );
  getAllQuestions({required ExamEntity exam}) async {
    emit(ExamQuestionLoading());
    final response = await _getAllQuestionsUseCase.call(exam.id);
    response.fold(
      (l) {
        startTimer(time: exam.duration);
        allQuestion = l;
        emit(ExamQuestionSuccess());
      },
      (r) {
        emit(ExamQuestionFailure(errorMessage: r.errorMessage));
      },
    );
  }

  Future<void> checkQuestionResult() async {
    emit(ExamQuestionLoading());
    final examSubmitRequestModel = ExamSubmitRequestModel(
      answers: question.entries.map((entry) {
        return AnswerSubmitRequestModel(
          questionId: entry.key,
          correct: entry.value.correct,
        );
      }).toList(),
      time: 0,
    );
    final response = await _checkQuestionsOnExamUseCase.call(
      examSubmitRequestModel,
    );
    response.fold(
      (l) {
        result = l;
        emit(ExamQuestionShowResult());
      },
      (r) {
        emit(ExamQuestionFailure(errorMessage: r.errorMessage));
      },
    );
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
    emit(ExamQuestionInitial());
  }

  void onPageChange(int value) {
    currentPage = value;
    if (currentPage != allQuestion.length) {
      emit(ExamQuestionInitial());
    }
  }

  void nextQuestion() {
    final isLastQuestion = currentPage >= allQuestion.length - 1;

    if (isLastQuestion) {
      _timer.cancel();
      checkQuestionResult();
      return;
    }
    currentPage += 1;
    pageController.jumpToPage(currentPage);
    emit(ExamQuestionInitial());
  }

  void backQuestion() {
    final isFirstQuestion = currentPage <= 0;
    if (!isFirstQuestion) {
      currentPage -= 1;
      pageController.jumpToPage(currentPage);
      emit(ExamQuestionInitial());
    }
  }

  void startTimer({required int time}) {
    timeLeft = Duration(minutes: time);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.inSeconds == 0) {
        checkQuestionResult();
        timer.cancel();
      } else {
        timeLeft -= const Duration(seconds: 1);
        emit(ExamQuestionInitial());
      }
    });
  }

  startExamAgain({required ExamEntity exam}) {
    currentPage = 0;
    question = {};
    getAllQuestions(exam: exam);
  }

  @override
  Future<void> close() {
    _timer.cancel();
    pageController.dispose();
    return super.close();
  }
}
