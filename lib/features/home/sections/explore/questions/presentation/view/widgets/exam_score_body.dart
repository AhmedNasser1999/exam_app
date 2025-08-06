import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/result_score_item_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_result_chart.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/widgets/custom_result_score.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/question_cubit/question_cubit.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/result_cubit/result_cubit.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/result_exam_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScoreBody extends StatelessWidget {
  const ExamScoreBody({super.key, required this.examInfo});
  final ExamEntity examInfo;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final resultCubit = context.read<ResultCubit>();
    final questionCubit = context.read<QuestionCubit>();
    return BlocBuilder<ResultCubit, ResultState>(
      builder: (context, state) {
        if (state is ResultLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ResultFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ResultSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                title: TextConstant.examScoreTitle,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 40),
              Text(TextConstant.yourScore, style: theme.textTheme.titleMedium),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Expanded(
                    child: CustomResultChart(
                      number: resultCubit.result.total != "NaN%"
                          ? double.tryParse(
                                  resultCubit.result.total.substring(
                                    0,
                                    resultCubit.result.total.length - 1,
                                  ),
                                ) ??
                                0
                          : 0,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      spacing: 10,
                      children: [
                        CustomResultScoreItem(
                          resultScoreItemModel: ResultScoreItemModel(
                            title: TextConstant.correct,
                            numberOfResult: resultCubit.result.correctAnswer
                                .toString(),
                            colorItem: theme.colorScheme.primary,
                          ),
                        ),
                        CustomResultScoreItem(
                          resultScoreItemModel: ResultScoreItemModel(
                            title: TextConstant.incorrect,
                            numberOfResult: resultCubit.result.inCorrectAnswer
                                .toString(),
                            colorItem: theme.colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              CustomButton(
                buttonModel: ButtonModel(
                  text: TextConstant.showResult,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ResultExamView.routeName,
                      arguments: ExamInfoEntity(
                        time: examInfo.duration,
                        examName: examInfo.title,
                        numberOfQuestion: examInfo.numberOfQuestions,
                        correct: resultCubit.result.correctAnswer,
                        listQuestion: questionCubit.allQuestion,
                      ),
                    );
                  },
                  borderRadius: 25,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                buttonModel: ButtonModel(
                  text: TextConstant.startAgain,
                  onPressed: () {
                    questionCubit.startExamAgain(exam: examInfo);
                  },
                  backgroundColor: theme.colorScheme.onSecondary,
                  borderRadius: 25,
                  textColor: theme.colorScheme.primary,
                ),
              ),
            ],
          );
        }
        return const Center(child: Text("No Result"));
      },
    );
  }
}
