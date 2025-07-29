import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/list_exam_items.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view_model/cubit/fetch_exam_all_by_id_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              title: "exams",
              backRouteName: HomeView.routeName,
            ),
            const SizedBox(height: 40),
            BlocBuilder<FetchExamAllByIdCubit, FetchExamAllByIdBaseState>(
              builder: (context, state) {
                if (state.baseState!.isLoading!) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.baseState!.data!.isEmpty) {
                  return const Center(child: Text("No data"));
                } else if (state.baseState!.errorMessage!.isNotEmpty) {
                  return Center(
                    child: Text(state.baseState?.errorMessage ?? ""),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => ListExamItems(
                      listOfAllExam: state.baseState?.data ?? [],
                    ),
                    itemCount: state.baseState?.data?.length ?? 0,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
