import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/helper_function/validation.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/custom_section_identifier_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendEmailBody extends StatelessWidget {
  const SendEmailBody({
    super.key,
    required this.formKey,
    required this.controller,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomSectionIdentifierScreen(
            title: TextConstant.forgetPasswordTitle,
            description: TextConstant.instructionLineForgetPasswordEmailSender,
          ),
          const SizedBox(height: 32.0),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              controller: controller,
              label: TextConstant.emailLabel,
              hintText: TextConstant.emailHint,
              validator: Validation.validateEmail,
            ),
          ),
          const SizedBox(height: 50.0),
          CustomButton(
            buttonModel: ButtonModel(
              text: TextConstant.continueButton,
              onPressed: () => cubit.formValidateEmail(
                formKey: formKey,
                email: controller.text,
              ),
              borderRadius: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}
