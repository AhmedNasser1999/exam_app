import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';

import 'package:exam_app/features/home/sections/result/presentation/view/widgets/list_all_exam_item.dart';
import 'package:flutter/material.dart';

class SectionAllExamsResults extends StatelessWidget {
  const SectionAllExamsResults({super.key, required this.examInfoModel});
  final List<ExamInfoModel> examInfoModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextConstant.exams, style: theme.textTheme.titleMedium),
        const SizedBox(height: 24),
        Expanded(child: ListAllExamItems(examInfoModel: examInfoModel)),
      ],
    );
  }
}
