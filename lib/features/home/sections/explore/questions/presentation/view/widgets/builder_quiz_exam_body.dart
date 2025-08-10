import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/exam_questions_body.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/exam_score_body.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/question_cubit/question_cubit.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/result_cubit/result_cubit.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderQuizExamBody extends StatelessWidget {
  const BuilderQuizExamBody({super.key, required this.examEntity});
  final ExamEntity examEntity;

  @override
  Widget build(BuildContext context) {
    final timerCubit = context.read<TimerCubit>();
    final questionCubit = context.read<QuestionCubit>();
    final resultCubit = context.read<ResultCubit>();

    return BlocConsumer<QuestionCubit, QuestionState>(
      listener: (context, state) {
        if (state is QuestionFinishExam) {
          resultCubit.checkQuestionResult(questionCubit.question);
          resultCubit.saveQuestionsResult(
            examInfo: ExamInfoEntity(
              time: examEntity.duration,
              examName: examEntity.title,
              numberOfQuestion: examEntity.numberOfQuestions,
              correct: resultCubit.result.correctAnswer,
              listQuestion: questionCubit.allQuestion,
            ),
          );
        }
        if (state is QuestionSuccess) {
          timerCubit.startTimer(time: examEntity.duration);
        }
      },
      builder: (context, state) {
        if (state is QuestionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuestionFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is QuestionSuccess || state is QuestionInitial) {
          return ExamQuestionsBody(listQuestion: questionCubit.allQuestion);
        } else if (state is QuestionFinishExam) {
          return ExamScoreBody(examInfo: examEntity);
        }
        return const Center(child: Text("No data"));
      },
    );
  }
}
