import 'package:exam_app/features/home/explore/subjects/domain/use-cases/get_subjects_use_case.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view_model/subjects/subjects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectsCubit extends Cubit<SubjectsState> {
  final GetSubjectsUseCase getSubjectsUseCase;

  SubjectsCubit(this.getSubjectsUseCase) : super(SubjectsState.initial());

  Future<void> fetchSubjects() async {
    emit(state.copyWith(isLoading: true));

    final result = await getSubjectsUseCase.execute();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
        );
      },
      (subjectList) {
        emit(state.copyWith(isLoading: false, subjects: subjectList));
      },
    );
  }
}
