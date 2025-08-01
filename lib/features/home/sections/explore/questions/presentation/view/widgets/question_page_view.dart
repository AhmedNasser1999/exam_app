import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/section_questions_items.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/cubit/exam_question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionPageView extends StatelessWidget {
  const QuestionPageView({super.key, required this.allQuestion});
  final List<QuestionsEntity> allQuestion;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamQuestionCubit>();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: PageView(
        controller: cubit.pageController,
        allowImplicitScrolling: true,
        onPageChanged: cubit.onPageChange,
        children: List.generate(
          allQuestion.length,
          (index) => SectionQuestionsItems(questionsEntity: allQuestion[index]),
        ),
      ),
    );
  }
}
