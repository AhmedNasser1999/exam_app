import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signup/presentation/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBuilder extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInBuilder({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login', style: theme.textTheme.titleLarge),
            const SizedBox(height: 24.0),

            CustomTextFormField(
              textFieldModel: TextFieldModel(
                controller: emailController,
                label: 'Email',
                hintText: 'Enter Your Email',
              ),
            ),
            const SizedBox(height: 24.0),

            CustomTextFormField(
              textFieldModel: TextFieldModel(
                controller: passwordController,
                label: 'Password',
                hintText: 'Enter Your Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20.0),

            Row(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text('Remember me', style: TextStyle(fontSize: 13.0)),
                  ],
                ),
                const Spacer(),
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
                text: 'Login',
                onPressed: () {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  context.read<SignInCubit>().signIn(email, password);
                },
                borderRadius: 30.0,
                backgroundColor: const Color(0xff022D82),
              ),
            ),
            const SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
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
    );
  }
}
