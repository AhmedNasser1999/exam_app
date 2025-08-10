import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/views/change_password_screen.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionTextFiled extends StatelessWidget {
  const SectionTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Column(
      children: [
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            controller: cubit.userNameController,
            label: TextConstant.userNameLabel,
            hintText: TextConstant.userNameHint,
          ),
        ),
        const SizedBox(height: 25.0),
        Row(
          spacing: 16.0,
          children: [
            Expanded(
              child: SizedBox(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: cubit.firstNameController,
                    label: TextConstant.firstNameLabel,
                    hintText: TextConstant.firstNameHint,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: cubit.lastNameController,
                    label: TextConstant.lastNameLabel,
                    hintText: TextConstant.lastNameHint,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25.0),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            controller: cubit.emailController,
            label: TextConstant.emailLabel,
            hintText: TextConstant.emailHint,
          ),
        ),
        const SizedBox(height: 25.0),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            suffixIcon: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ChangePasswordScreen.routeName);
              },
              child: const Text(
                TextConstant.change,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            label: TextConstant.passwordLabel,
            hintText: TextConstant.passwordHint,
            controller: cubit.passwordController,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 25.0),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            keyboardType: TextInputType.phone,
            controller: cubit.phoneController,
            label: TextConstant.phoneNumberLabel,
            hintText: TextConstant.phoneNumberHint,
          ),
        ),
      ],
    );
  }
}
