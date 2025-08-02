import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/all_exam_builder.dart';
import 'package:flutter/material.dart';

class AllExamBody extends StatelessWidget {
  const AllExamBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            CustomHeader(
              title: TextConstant.exams,
              backRouteName: HomeView.routeName,
            ),
            SizedBox(height: 40),
            AllExamBuilder(),
          ],
        ),
      ),
    );
  }
}
