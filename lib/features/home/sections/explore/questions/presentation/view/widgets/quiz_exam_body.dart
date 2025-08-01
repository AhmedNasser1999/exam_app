import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/exam_questions_body.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/exam_score_body.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/cubit/exam_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizExamBody extends StatelessWidget {
  const QuizExamBody({super.key, required this.examEntity});
  final ExamEntity examEntity;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamQuestionCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocBuilder<ExamQuestionCubit, ExamQuestionState>(
          builder: (context, state) {
            if (state is ExamQuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExamQuestionFailure) {
              return Center(child: Text(state.errorMessage));
            } else if (state is ExamQuestionSuccess ||
                state is ExamQuestionInitial) {
              return ExamQuestionsBody(listQuestion: cubit.allQuestion);
            } else if (state is ExamQuestionScore) {
              return const ExamScoreBody();
            }
            return const Center(child: Text("No data"));
          },
        ),
      ),
    );
  }
}
