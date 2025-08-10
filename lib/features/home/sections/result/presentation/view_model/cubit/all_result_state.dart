part of 'all_result_cubit.dart';

sealed class AllResultState {}

final class AllResultInitial extends AllResultState {}

final class AllResultLoading extends AllResultState {}

final class AllResultSuccess extends AllResultState {
  final List<ExamInfoEntity> examsResult;

  AllResultSuccess({required this.examsResult});
}

final class AllResultFailure extends AllResultState {
  final String errorMessage;

  AllResultFailure({required this.errorMessage});
}
