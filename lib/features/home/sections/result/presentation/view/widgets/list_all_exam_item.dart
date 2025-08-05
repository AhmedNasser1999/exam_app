import 'package:exam_app/core/custom_widgets_model/exam_item_model.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/custom_exam_item.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/result_exam_view.dart';
import 'package:flutter/material.dart';

class ListAllExamItems extends StatelessWidget {
  const ListAllExamItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CustomExamItem(
        examItemModel: ExamItemModel(
          title: 'Js',
          time: "20",
          numQuestion: "20",
          examInfo: "18 corrected answers in 25 min.",
          onTap: () {
            Navigator.pushNamed(context, ResultExamView.routeName);
          },
        ),
      ),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
