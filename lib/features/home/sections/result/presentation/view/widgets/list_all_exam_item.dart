import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/constant/text_constant.dart';
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
    if (examInfoModel.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(AppAssets.noContent, fit: BoxFit.cover),
            ),
            const Text(TextConstant.noResultsAvailable),
          ],
        ),
      );
    } else {
      return ListView.separated(
        itemBuilder: (context, index) => CustomExamItem(
          examItemModel: ExamItemModel(
            title: examInfoModel[index].examName,
            time: examInfoModel[index].time.toString(),
            numQuestion: examInfoModel[index].listQuestion.length.toString(),
            examInfo:
                "${examInfoModel[index].correct} corrected answers in ${examInfoModel[index].time} min.",
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
}
