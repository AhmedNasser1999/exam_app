import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/use_cases/get_subjects_use_case.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view_model/subjects/subjects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectsCubit extends Cubit<SubjectsState> {
  final GetSubjectsUseCase getSubjectsUseCase;

  SubjectsCubit(this.getSubjectsUseCase) : super(SubjectsState.initial());

  Future<void> fetchSubjects() async {
    emit(state.copyWith(isLoading: true));

    final response = await getSubjectsUseCase.call();
    switch (response) {
      case SuccessApiResult<List<SubjectEntity>>():
        emit(state.copyWith(isLoading: false, subjects: response.data));
      case FailureApiResult<List<SubjectEntity>>():
        emit(state.copyWith(isLoading: false, errorMessage: response.error.errorMessage));
    }
  }
}
