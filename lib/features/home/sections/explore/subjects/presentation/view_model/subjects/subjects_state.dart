import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';

class SubjectsState {
  final bool isLoading;
  final List<SubjectEntity> subjects;
  final String? errorMessage;

  const SubjectsState({
    this.isLoading = true,
    this.subjects = const [],
    this.errorMessage,
  });

  SubjectsState copyWith({
    bool? isLoading,
    List<SubjectEntity>? subjects,
    String? errorMessage,
  }) {
    return SubjectsState(
      isLoading: isLoading ?? this.isLoading,
      subjects: subjects ?? this.subjects,
      errorMessage: errorMessage,
    );
  }

  factory SubjectsState.initial() => const SubjectsState();
}
