import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/core/widgets/subject_item.dart';
import 'package:flutter/material.dart';

class SubjectExamBody extends StatelessWidget {
  SubjectExamBody({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Survey',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.blue[0]),
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
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.blue[100]),
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) => SubjectItem(
                onTap: () {},
                title: 'Language',
                imageUrl:
                    'https://www.collinsdictionary.com/images/thumb/apple_158989157_250.jpg?version=6.0.84',
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
