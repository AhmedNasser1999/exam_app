import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/core/widgets/subject_item.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view_model/subjects/subjects_cubit.dart';
import 'package:exam_app/features/home/explore/subjects/presentation/view_model/subjects/subjects_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectExamBody extends StatelessWidget {
  static const String routeName = RouteName.subjectExamBody;

  SubjectExamBody({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubjectsCubit>(
      create: (context) => getIt.get<SubjectsCubit>()..fetchSubjects(),
      child: BlocConsumer<SubjectsCubit, SubjectsState>(
        listener: (context, state) {
          if (state.errorMessage != null && context.mounted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  customSnackBar(
                    contentType: ContentType.failure,
                    message: state.errorMessage!,
                    title: TextConstant.failureTitle,
                  ),
                );
            });
          }
        },
        builder: (context, state) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Survey',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.blue[0]),
                  ),
                  const SizedBox(height: 15.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      controller: searchController,
                      label: 'Search',
                      hintText: 'Search',
                      iconData: Icons.search,
                      borderRadius: 20.0,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    'Browse by subject',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.blue[100]),
                  ),
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.subjects.length,
                      itemBuilder: (context, index) {
                        final subject = state.subjects[index];
                        return SubjectItem(
                          onTap: () {},
                          title: subject.name ?? '',
                          imageUrl: subject.icon ?? '',
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15.0),
                    ),
                  ),
                ],
              ),
            ),
            if (state.isLoading)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}