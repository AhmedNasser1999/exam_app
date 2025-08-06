import 'dart:developer';

import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/data_source/profile_local_data_source.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_request_model.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final localDataSource = ProfileLocalDataSource();

  final UserTokenStorage userTokenStorage = getIt<UserTokenStorage>();

  EditProfileUseCase editProfileUseCase;

  ProfileCubit(this.editProfileUseCase) : super(const ProfileState());

  Future<void> editProfile() async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );
    final profileRequest = ProfileRequestModel(
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );

    print('Request Object: $profileRequest');
    print('Serialized Request: ${profileRequest.toJson()}');

    final profile = await editProfileUseCase.execute(profileRequest);

    profile.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.errorMessage,
            successMessage: null,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            successMessage: 'Your profile has been updated successfully.',
            errorMessage: null,
          ),
        );
      },
    );
  }

  void formValidateOnEditProfile() {
    if (formKey.currentState!.validate()) {
      editProfile();
    }
  }

  Future<void> getProfileLocalData() async {
    final profile = await ProfileLocalDataSource.loadProfileFromPrefs();

    final username = profile.username ?? '';
    final firstName = profile.firstName ?? '';
    final lastName = profile.lastName ?? '';
    final email = profile.email ?? '';
    final phone = profile.phone ?? '';

    // log(username);
    // log(firstName);
    // log(email);
    userNameController.text = username;
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    emailController.text = email;
    phoneController.text = phone;

    emit(
      state.copyWith(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      ),
    );
  }

  logout(context) async {
    Navigator.pushReplacementNamed(context, SignInView.routeName);

    await userTokenStorage.removeToken();
  }
}
