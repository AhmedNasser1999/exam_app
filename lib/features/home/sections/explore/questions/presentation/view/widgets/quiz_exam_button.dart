import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/question_cubit/question_cubit.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizExamButton extends StatelessWidget {
  const QuizExamButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<QuestionCubit>();
    final _timerCubit = context.read<TimerCubit>();
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return Row(
          spacing: 16,
          children: [
            Expanded(
              child: CustomButton(
                buttonModel: ButtonModel(
                  text: "Back",
                  onPressed: () => cubit.backQuestion(),
                  backgroundColor: theme.colorScheme.onSecondary,
                  textColor: theme.colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              child: CustomButton(
                buttonModel: ButtonModel(
                  text: cubit.currentPage == cubit.allQuestion.length - 1
                      ? "Finish"
                      : "Next",
                  onPressed: () {
                    if (cubit.currentPage == cubit.allQuestion.length - 1) {
                      _timerCubit.timerFinish();
                    }
                    cubit.nextQuestion();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
