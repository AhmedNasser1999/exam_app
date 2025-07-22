import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/helper_function/validation.dart';
import 'package:exam_app/core/widgets/custom_text_button.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/widgets/custom_section_identifier_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class VerificationEmailBody extends StatelessWidget {
  const VerificationEmailBody({
    super.key,
    required this.formKey,
    required this.controller,
    required this.emailController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ForgetPasswordCubit>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomSectionIdentifierScreen(
            title: TextConstant.emailVerification,
            description: TextConstant.instructionEmailVerification,
          ),
          const SizedBox(height: 32),
          Pinput(
            validator: Validation.validateText,
            length: 6,
            keyboardType: TextInputType.number,
            onCompleted: (value) {
              cubit.verifiedCode(code: value);
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(TextConstant.notReceived, style: theme.textTheme.titleSmall),
              CustomTextButton(
                textButton: TextConstant.resend,
                onPressed: () =>
                    cubit.sendEmailCode(email: emailController.text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
