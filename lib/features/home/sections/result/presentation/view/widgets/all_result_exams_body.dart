import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/text_constant.dart';

import 'package:exam_app/features/home/sections/result/presentation/view/widgets/section_all_exams_results.dart';
import 'package:exam_app/features/home/sections/result/presentation/view_model/cubit/all_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllResultExamsBody extends StatelessWidget {
  const AllResultExamsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AllResultCubit, AllResultState>(
      builder: (context, state) {
        if (state is AllResultSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextConstant.resultsLabel,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: SectionAllExamsResults(examInfoModel: state.examsResult),
              ),
            ],
          );
        } else if (state is AllResultFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
