import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_button.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/section_text_field.dart';
import 'package:exam_app/features/auth/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBuilder extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpBuilder({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomHeader(
                  title: TextConstant.signUpTitle,
                  backRouteName: SignInView.routeName,
                ),
                const SizedBox(height: 24),
                SectionTextField(formKey: formKey),
                const SizedBox(height: 62),
                CustomButton(
                  buttonModel: ButtonModel(
                    text: TextConstant.signUpButton,
                    borderRadius: 25,
                    onPressed: () async {
                      await signupCubit.validate(formKey: formKey);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(TextConstant.alreadyHaveAccount),
                    CustomTextButton(
                      textButton: TextConstant.loginText,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          SignInView.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
