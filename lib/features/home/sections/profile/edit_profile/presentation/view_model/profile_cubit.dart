import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_request_model.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/use_cases/get_user_info_use_case.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/use_cases/logout_use_case.dart';
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
  final TextEditingController passwordController = TextEditingController();
  final EditProfileUseCase _editProfileUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;

  ProfileCubit(
    this._editProfileUseCase,
    this._getUserInfoUseCase,
    this._logoutUseCase,
  ) : super(ProfileInitial());

  Future<void> editProfile() async {
    emit(ProfileUpdateLoading());
    final profileRequest = ProfileRequestModel(
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    final profile = await _editProfileUseCase.call(profileRequest);
    profile.fold(
      (failure) {
        emit(ProfileUpdateFailure(errorMassage: failure.errorMessage));
      },
      (success) {
        emit(ProfileUpdateSuccess());
      },
    );
  }

  void formValidateOnEditProfile(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      editProfile();
    }
  }

  Future<void> getProfileRemoteData() async {
    emit(ProfileLoading());
    final profileResponse = await _getUserInfoUseCase.call();
    profileResponse.fold(
      (failure) {
        emit(ProfileFailure(errorMassage: failure.errorMessage));
      },
      (profileData) {
        final username = profileData.username ?? '';
        final firstName = profileData.firstName ?? '';
        final lastName = profileData.lastName ?? '';
        final email = profileData.email ?? '';
        final phone = profileData.phone ?? '';

        userNameController.text = username;
        firstNameController.text = firstName;
        lastNameController.text = lastName;
        emailController.text = email;
        phoneController.text = phone;
        passwordController.text = "0000000";
        emit(ProfileSuccess());
      },
    );
  }

  logout() async {
    await _logoutUseCase.call();
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    return super.close();
  }
}
