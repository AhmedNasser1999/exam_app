import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/custom_widgets_model/text_field_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/views/change_password_screen.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_cubit.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfileRemoteData(),

      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.successMessage != null &&
              state.successMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                customSnackBar(
                  contentType: ContentType.success,
                  message: TextConstant.profileUpdateSuccess,
                  title: TextConstant.successTitle,
                ),
              );
          } else if (state.errorMessage != null &&
              state.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                customSnackBar(
                  contentType: ContentType.success,
                  message: TextConstant.profileUpdateError,
                  title: TextConstant.successTitle,
                ),
              );
          }
        },

        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextConstant.editProfile,
                        style: theme.textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: () async {
                          await cubit.logout(context);
                        },
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      controller: cubit.userNameController,
                      label: TextConstant.userNameLabel,
                      hintText: TextConstant.userNameHint,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    spacing: 16.0,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: CustomTextFormField(
                            textFieldModel: TextFieldModel(
                              controller: cubit.firstNameController,
                              label: TextConstant.firstNameLabel,
                              hintText: TextConstant.firstNameHint,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: CustomTextFormField(
                            textFieldModel: TextFieldModel(
                              controller: cubit.lastNameController,
                              label: TextConstant.lastNameLabel,
                              hintText: TextConstant.lastNameHint,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      controller: cubit.emailController,
                      label: TextConstant.emailLabel,
                      hintText: TextConstant.emailHint,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      suffixIcon: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ChangePasswordScreen.routeName,
                          );
                        },
                        child: const Text(
                          TextConstant.change,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      label: TextConstant.passwordLabel,
                      hintText: TextConstant.passwordHint,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    textFieldModel: TextFieldModel(
                      keyboardType: TextInputType.phone,
                      controller: cubit.phoneController,
                      label: TextConstant.phoneNumberLabel,
                      hintText: TextConstant.phoneNumberHint,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  CustomButton(
                    buttonModel: ButtonModel(
                      text: TextConstant.update,
                      onPressed: () {
                        cubit.formValidateOnEditProfile();
                      },
                      borderRadius: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
