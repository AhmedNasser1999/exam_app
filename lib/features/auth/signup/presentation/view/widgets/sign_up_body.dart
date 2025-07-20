import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/core/widgets/custom_text_button.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/custom_header.dart';
import 'package:exam_app/features/auth/signup/presentation/view/widgets/section_text_field.dart';
import 'package:exam_app/features/auth/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is SignupFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.failure,
                message: state.errorMessage,
                title: TextConstant.failureTitle,
              ),
            );
        } else if (state is SignupSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.success,
                message: "",
                title: TextConstant.successTitle,
              ),
            );
        }
      },
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(TextConstant.alreadyHaveAccount),
                  CustomTextButton(
                    textButton: TextConstant.loginButton,
                    routeName: SignInView.routeName,
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
