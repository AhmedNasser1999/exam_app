import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/helper_function/validation.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/view/widgets/custom_remember_me_widget.dart';
import 'package:exam_app/features/auth/signup/presentation/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBuilder extends StatefulWidget {
  const SignInBuilder({super.key});

  @override
  State<SignInBuilder> createState() => _SignInBuilderState();
}

class _SignInBuilderState extends State<SignInBuilder> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    var theme = Theme.of(context);
    return Form(
      key: formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextConstant.loginText, style: theme.textTheme.titleLarge),
              const SizedBox(height: 24.0),
              CustomTextFormField(
                textFieldModel: TextFieldModel(
                  controller: cubit.emailController,
                  label: TextConstant.emailLabel,
                  hintText: TextConstant.emailHint,
                  validator: Validation.validateEmail,
                ),
              ),
              const SizedBox(height: 24.0),

              CustomTextFormField(
                textFieldModel: TextFieldModel(
                  controller: cubit.passwordController,
                  label: TextConstant.passwordLabel,
                  hintText: TextConstant.passwordHint,
                  obscureText: true,
                  validator: Validation.validateText,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomRememberMeWidget(),
                  CustomTextButton(
                    textButton: TextConstant.forgetPassword,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ForgetPasswordView.routeName,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 70.0),
              CustomButton(
                buttonModel: ButtonModel(
                  text: TextConstant.loginText,
                  onPressed: () {
                    cubit.formValidateSignIn(formKey: formKey);
                  },
                  borderRadius: 100,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(TextConstant.dontHaveAccount),
                  CustomTextButton(
                    textButton: TextConstant.signUpTitle,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        SignUpView.routeName,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
