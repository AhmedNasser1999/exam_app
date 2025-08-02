import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/exam_questions_body.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/exam_score_body.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/exam_quiz/exam_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderQuizExamBody extends StatelessWidget {
  const BuilderQuizExamBody({super.key, required this.examEntity});
  final ExamEntity examEntity;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamQuestionCubit>();

    return BlocBuilder<ExamQuestionCubit, ExamQuestionState>(
      builder: (context, state) {
        if (state is ExamQuestionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExamQuestionFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ExamQuestionSuccess ||
            state is ExamQuestionInitial) {
          return ExamQuestionsBody(listQuestion: cubit.allQuestion);
        } else if (state is ExamQuestionShowResult) {
          return ExamScoreBody(examInfo: examEntity);
        }
        return const Center(child: Text("No data"));
      },
    );
  }
}
