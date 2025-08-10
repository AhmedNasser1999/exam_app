import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/widgets/list_subject_items.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view_model/subjects/subjects_cubit.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view_model/subjects/subjects_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectExamBody extends StatelessWidget {
  const SubjectExamBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextConstant.survey,
            style: theme.textTheme.titleLarge!.copyWith(
              color: AppColors.blue[0],
            ),
          ),
          const SizedBox(height: 15.0),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: TextEditingController(),
              label: 'Search',
              hintText: 'Search',
              borderRadius: 20.0,
            ),
          ),
          const SizedBox(height: 40.0),
          Text(
            'Browse by subject',
            style: theme.textTheme.titleMedium!.copyWith(
              color: AppColors.blue[100],
            ),
          ),
          const SizedBox(height: 24.0),
          BlocBuilder<SubjectsCubit, SubjectsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.errorMessage!.isNotEmpty) {
                return Center(child: Text(state.errorMessage!));
              } else if (state.subjects.isEmpty) {
                return const Center(child: Text("No Data"));
              }
              return Expanded(
                child: ListSubjectItems(listItems: state.subjects),
              );
            },
          ),
        ],
      ),
    );
  }
}
