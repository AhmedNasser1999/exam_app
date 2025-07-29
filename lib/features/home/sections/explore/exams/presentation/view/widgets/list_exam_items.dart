import 'package:exam_app/core/custom_widgets_model/exam_item_model.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/exam_view.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/custom_exam_item.dart';
import 'package:flutter/material.dart';

class ListExamItems extends StatelessWidget {
  const ListExamItems({super.key, required this.listOfAllExam});
  final List<ExamEntity> listOfAllExam;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Text(
          "Exams",
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomExamItem(
            examItemModel: ExamItemModel(
              title: listOfAllExam[index].title,
              time: listOfAllExam[index].duration.toString(),
              numQuestion: listOfAllExam[index].numberOfQuestions.toString(),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  ExamView.routeName,
                  arguments: listOfAllExam[index].id,
                );
              },
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: listOfAllExam.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
