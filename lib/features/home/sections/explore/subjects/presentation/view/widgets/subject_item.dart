import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/all_exam_view.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  final SubjectEntity subjectItemModel;
  const SubjectItem({super.key, required this.subjectItemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          AllExamView.routeName,
          arguments: subjectItemModel.idEntity,
        );
      },
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
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: subjectItemModel.imageIcon,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Text(subjectItemModel.nameEntity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
