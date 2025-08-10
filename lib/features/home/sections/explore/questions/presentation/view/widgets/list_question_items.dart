import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/answer_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_questions_items.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/question_cubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListQuestionItems extends StatelessWidget {
  const ListQuestionItems({super.key, required this.questionsEntity});
  final QuestionsEntity questionsEntity;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionCubit>();
    return ListView.separated(
      itemBuilder: (context, index) => CustomQuestionsItems(
        answerModel: questionsEntity.answer[index],
        id: questionsEntity.questionId,
        onTap: () {
          questionsEntity.answer[index].isSelected =
              !questionsEntity.answer[index].isSelected;
          cubit.addNewAnswer(
            answer: AnswerSubmitRequestModel(
              questionId: questionsEntity.questionId,
              correct: questionsEntity.answer[index].key,
            ),
            isSelected: questionsEntity.answer[index].isSelected,
          );
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: questionsEntity.answer.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
