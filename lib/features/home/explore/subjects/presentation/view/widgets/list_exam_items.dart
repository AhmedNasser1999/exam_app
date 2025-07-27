import 'package:exam_app/core/custom_widgets_model/exam_item_model.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/exam_view.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view/widgets/custom_exam_item.dart';
import 'package:flutter/material.dart';

class ListExamItems extends StatelessWidget {
  const ListExamItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Text(
          "Exam title",
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomExamItem(
            examItemModel: ExamItemModel(
              title: "JavaScript Quiz",
              time: "30",
              numQuestion: "20",
              onTap: () {
                Navigator.pushReplacementNamed(context, ExamView.routeName);
              },
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: 4,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
