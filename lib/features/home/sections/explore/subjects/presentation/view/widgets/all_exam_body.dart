import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/list_exam_items.dart';

import 'package:flutter/material.dart';

class AllExamBody extends StatelessWidget {
  const AllExamBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const CustomHeader(
              title: "Language",
              backRouteName: HomeView.routeName,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const ListExamItems(),
                itemCount: 4,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
