part of 'result_cubit.dart';

sealed class ResultState {}

final class ResultInitial extends ResultState {}

final class ResultSuccess extends ResultState {}

final class ResultLoading extends ResultState {}

final class ResultFailure extends ResultState {
  final String errorMessage;

  ResultFailure({required this.errorMessage});
}
