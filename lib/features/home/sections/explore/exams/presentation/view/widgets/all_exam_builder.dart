import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/exam_start_body.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/widgets/list_exam_items.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view_model/cubit/fetch_exam_all_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllExamBuilder extends StatelessWidget {
  const AllExamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchExamAllByIdCubit, FetchExamAllByIdBaseState>(
      builder: (context, state) {
        if (state.baseState!.isLoading!) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.baseState!.startExam!) {
          return ExamStartBody(examInfoEntity: state.baseState?.selectExam);
        } else if (state.baseState!.allExams!.isEmpty) {
          return const Center(child: Text("No data"));
        } else if (state.baseState!.error!.isNotEmpty) {
          return Center(child: Text(state.baseState?.error ?? ""));
        }
        return Expanded(
          child: ListExamItems(listOfAllExam: state.baseState?.allExams ?? []),
        );
      },
    );
  }
}
