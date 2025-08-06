import 'package:exam_app/core/custom_widgets_model/exam_item_model.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/custom_exam_item.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/result_exam_view.dart';
import 'package:flutter/material.dart';

class ListAllExamItems extends StatelessWidget {
  const ListAllExamItems({super.key, required this.examInfoModel});
  final List<ExamInfoEntity> examInfoModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CustomExamItem(
        examItemModel: ExamItemModel(
          title: examInfoModel[index].examName,
          time: examInfoModel[index].time.toString(),
          numQuestion: examInfoModel[index].numberOfQuestion.toString(),
          examInfo:
              "${examInfoModel[index].correct} corrected answers in ${examInfoModel[index].numberOfQuestion} min.",
          onTap: () {
            Navigator.pushNamed(
              context,
              ResultExamView.routeName,
              arguments: examInfoModel[index],
            );
          },
        ),
      ),
      itemCount: examInfoModel.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
