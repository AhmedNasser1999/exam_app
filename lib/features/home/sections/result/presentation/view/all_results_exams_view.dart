import 'package:exam_app/features/home/sections/result/presentation/view/widgets/all_result_exams_body.dart';
import 'package:flutter/material.dart';

class AllResultsView extends StatelessWidget {
  const AllResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AllResultExamsBody(),
      ),
    );
  }
}
