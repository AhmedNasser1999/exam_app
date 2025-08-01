part of 'exam_question_cubit.dart';

sealed class ExamQuestionState {}

class ExamQuestionInitial extends ExamQuestionState {}

class ExamQuestionLoading extends ExamQuestionState {}

class ExamQuestionSuccess extends ExamQuestionState {
}
class ExamQuestionScore extends ExamQuestionState {
}

class ExamQuestionFailure extends ExamQuestionState {
  final String errorMessage;

  ExamQuestionFailure({required this.errorMessage});
}
