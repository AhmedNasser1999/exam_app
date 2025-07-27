import 'package:exam_app/core/custom_widgets_model/result_score_item_model.dart';
import 'package:flutter/material.dart';

class CustomResultScoreItem extends StatelessWidget {
  const CustomResultScoreItem({super.key, required this.resultScoreItemModel});
  final ResultScoreItemModel resultScoreItemModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          resultScoreItemModel.title,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: resultScoreItemModel.colorItem,
          ),
        ),

        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: resultScoreItemModel.colorItem, width: 2),
          ),
          child: Center(
            child: Text(
              resultScoreItemModel.numberOfResult,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: resultScoreItemModel.colorItem,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
