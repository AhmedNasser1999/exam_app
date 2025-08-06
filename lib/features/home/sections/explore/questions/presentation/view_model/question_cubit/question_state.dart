part of 'question_cubit.dart';

sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionSuccess extends QuestionState {}

final class QuestionNewExam extends QuestionState {}

final class QuestionFailure extends QuestionState {
  final String errorMessage;

  QuestionFailure({required this.errorMessage});
}
