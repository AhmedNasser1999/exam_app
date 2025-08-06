import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/view_model/change_password_cubit.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/view_model/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = RouteName.changePassword;

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state.successMessage != null && state.successMessage!.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.success,
                message: TextConstant.passwordChangeSuccess,
                title: TextConstant.successTitle,
              ),
            );
        } else if (state.errorMessage != null &&
            state.errorMessage!.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.failure,
                message: TextConstant.passwordChangeError,
                title: TextConstant.successTitle,
              ),
            );
        }
      },
      builder: (context, state) {
        final cubit = context.read<ChangePasswordCubit>();

        return Scaffold(
          body: Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        TextConstant.resetPassword,
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 35.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      controller: cubit.oldPassword,
                      label: TextConstant.currentPasswordLabel,
                      hintText: TextConstant.currentPasswordHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstant.askForNewPassword;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      controller: cubit.newPassword,
                      label: TextConstant.newPasswordLabel,
                      hintText: TextConstant.newPasswordHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstant.askForNewPassword;
                        }
                        if (value.length < 8) {
                          return TextConstant.validateNewPassword;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      controller: cubit.rePassword,
                      label: TextConstant.confirmPasswordLabel,
                      hintText: TextConstant.confirmPasswordHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstant.pleaseConfermPassword;
                        }
                        if (value != cubit.newPassword.text) {
                          return TextConstant.passwordNotMatch;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 55.0),
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          buttonModel: ButtonModel(
                            text: TextConstant.update,
                            onPressed: () {
                              cubit.formValidateOnChangePassword();
                            },
                            borderRadius: 30.0,
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
