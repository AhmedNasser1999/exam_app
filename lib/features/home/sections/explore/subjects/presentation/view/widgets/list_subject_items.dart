
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/subject_item.dart';
import 'package:flutter/material.dart';

class ListSubjectItems extends StatelessWidget {
  const ListSubjectItems({super.key, required this.listItems});
  final List<SubjectEntity> listItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listItems.length,
      itemBuilder: (context, index) =>
          SubjectItem(subjectItemModel: listItems[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
