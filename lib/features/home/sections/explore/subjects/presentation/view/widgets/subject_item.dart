import 'package:exam_app/core/custom_widgets_model/subject_item_model.dart';
import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  final SubjectItemModel subjectItemModel;
  const SubjectItem({super.key, required this.subjectItemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: subjectItemModel.onTap,
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    subjectItemModel.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10.0),
                Text(subjectItemModel.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
