part of 'fetch_exam_all_by_id_cubit.dart';

class FetchExamAllByIdBaseState {
  final BaseState<List<ExamEntity>>? baseState;

  FetchExamAllByIdBaseState({this.baseState});
  FetchExamAllByIdBaseState copyWith({BaseState<List<ExamEntity>>? baseState}) {
    return FetchExamAllByIdBaseState(
      baseState: BaseState(
        errorMessage: baseState?.errorMessage ?? "",
        data: baseState?.data ?? const [],
        isLoading: baseState?.isLoading ?? false,
      ),
    );
  }
}

class BaseState<T> {
  final String? errorMessage;
  final T? data;
  final bool? isLoading;

  BaseState({this.errorMessage, this.data, this.isLoading});
}
