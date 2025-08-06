import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/helper_function/validation.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/custom_widgets_model/text_field_model.dart';

class SectionTextField extends StatelessWidget {
  const SectionTextField({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: signupCubit.userNameController,
              hintText: TextConstant.userNameHint,
              label: TextConstant.userNameLabel,
              obscureText: false,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            spacing: 17,
            children: [
              Expanded(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: signupCubit.firstNameController,
                    label: TextConstant.firstNameLabel,
                    hintText: TextConstant.firstNameHint,
                    obscureText: false,
                  ),
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: signupCubit.lastNameController,
                    label: TextConstant.lastNameLabel,
                    hintText: TextConstant.lastNameHint,
                    obscureText: false,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: signupCubit.emailController,
              label: TextConstant.emailLabel,
              hintText: TextConstant.emailHint,
              obscureText: false,
              validator: Validation.validateEmail,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            spacing: 17,
            children: [
              Expanded(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: signupCubit.passwordController,
                    label: TextConstant.passwordLabel,
                    hintText: TextConstant.passwordHint,
                    obscureText: true,
                  ),
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: signupCubit.confirmPasswordController,
                    label: TextConstant.confirmPasswordLabel,
                    hintText: TextConstant.confirmPasswordHint,
                    obscureText: true,
                    validator: signupCubit.confirmPassword,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: signupCubit.phoneController,
              label: TextConstant.phoneNumberLabel,
              keyboardType: TextInputType.phone,
              hintText: TextConstant.phoneNumberHint,
              obscureText: false,
            ),
          ),
        ],
      ),
    );
  }
}
