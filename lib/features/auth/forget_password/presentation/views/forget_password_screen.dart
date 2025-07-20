import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  static const String routeName = RouteName.frogetPassword;

  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  CustomHeader(
                    title: TextConstant.passwordLabel,
                    backRouteName: SignInView.routeName,
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const Text(
                'Forget password',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Please enter your email associated to',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const Text(
                'your account',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32.0),
              Form(
                child: CustomTextFormField(
                  textFieldModel: TextFieldModel(
                    controller: emailController,
                    label: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                ),
              ),
              const SizedBox(height: 50.0),

              CustomButton(
                buttonModel: ButtonModel(
                  text: 'Continue ',
                  onPressed: () {},
                  borderRadius: 40.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
