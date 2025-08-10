part of 'fetch_exam_all_by_id_cubit.dart';

class FetchExamAllByIdBaseState {
  final AllExamBaseState? baseState;

  FetchExamAllByIdBaseState({this.baseState});
  FetchExamAllByIdBaseState copyWith({AllExamBaseState? baseState}) {
    return FetchExamAllByIdBaseState(
      baseState: AllExamBaseState(
        error: baseState?.errorMessage ?? "",
        allExams: baseState?.data ?? const [],
        isLoading: baseState?.isLoading ?? false,
        startExam: baseState?.startExam ?? false,
        selectExam: baseState?.selectExam,
      ),
    );
  }
}

class AllExamBaseState extends BaseState<List<ExamEntity>> {
  final bool? startExam;
  final ExamEntity? selectExam;
  @override
  final bool? isLoading;
  List<ExamEntity>? allExams;
  String? error;
  AllExamBaseState({
    this.error,
    this.isLoading,
    this.allExams,
    this.startExam,
    this.selectExam,
  }) : super(
         data: allExams ?? const [],
         errorMessage: error ?? "",
         isLoading: isLoading ?? false,
       );
}
