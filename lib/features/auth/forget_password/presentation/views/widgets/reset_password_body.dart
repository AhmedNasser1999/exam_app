import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/helper_function/validation.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/custom_section_identifier_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
    required this.formKey,
    required this.controller,
    required this.confirmController,
    required this.emailController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextEditingController confirmController;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomSectionIdentifierScreen(
            title: TextConstant.resetPassword,
            description: TextConstant.instructionPasswordRequirements,
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: controller,
              label: TextConstant.passwordLabel,
              hintText: TextConstant.passwordHint,
              validator: Validation.validateText,
            ),
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: confirmController,
              label: TextConstant.confirmPasswordLabel,
              hintText: TextConstant.confirmPasswordHint,
              validator: (value) => cubit.confirmPassword(
                value: value,
                confirmPasswordController: confirmController,
                passwordController: controller,
              ),
            ),
          ),
          const SizedBox(height: 48),
          CustomButton(
            buttonModel: ButtonModel(
              text: TextConstant.continueButton,
              borderRadius: 100,
              onPressed: () => cubit.formValidateResetPassword(
                formKey: formKey,
                request: ResetPasswordTokenRequest(
                  email: emailController.text,
                  newPassword: controller.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
