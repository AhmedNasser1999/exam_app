import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/helper_function/format_time.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/question_cubit/question_cubit.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomQuizExamHeader extends StatelessWidget {
  const CustomQuizExamHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<TimerCubit>();
    final questionCubit = context.read<QuestionCubit>();
    return Row(
      children: [
        CustomHeader(
          title: TextConstant.examScoreTitle,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Image.asset(AppAssets.imagesClock),
        const SizedBox(width: 8),
        BlocConsumer<TimerCubit, TimerState>(
          listener: (context, state) {
            if (state is TimerFinish) {
              questionCubit.examFinish();
            }
          },
          builder: (context, state) {
            return Text(
              FormatTime.formatDuration(cubit.timeLeft),
              style: theme.textTheme.bodyLarge!.copyWith(
                color: cubit.timeLeft > cubit.timeLeft ~/ 2
                    ? AppColors.green
                    : AppColors.red,
              ),
            );
          },
        ),
      ],
    );
  }
}
