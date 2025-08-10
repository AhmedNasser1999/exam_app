import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/custom_widgets_model/exam_item_model.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomExamItem extends StatelessWidget {
  const CustomExamItem({super.key, required this.examItemModel});
  final ExamItemModel examItemModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: GestureDetector(
          onTap: examItemModel.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              spacing: 8,
              children: [
                Image.asset(AppAssets.imagesExamIcon),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              examItemModel.title,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "${examItemModel.time} Minutes",
                            style: theme.textTheme.bodySmall!.copyWith(
                              color: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${examItemModel.numQuestion} Question",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      Text(
                        examItemModel.examInfo,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
