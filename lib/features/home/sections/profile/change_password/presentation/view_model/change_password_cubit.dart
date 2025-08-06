import 'package:exam_app/features/home/sections/profile/change_password/data/models/change_password_request.dart';
import 'package:exam_app/features/home/sections/profile/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/view_model/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit(this.changePasswordUseCase)
    : super(const ChangePasswordState());

  Future<void> changePassword() async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );
    final request = ChangePasswordRequest(
      oldPassword: oldPassword.text,
      password: newPassword.text,
      rePassword: rePassword.text,
    );
    print('Request Object: $request');
    print('Serialized Request: ${request.toJson()}');

    final message = await changePasswordUseCase.execute(request);

    message.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'An error occurred while changing the password',
            successMessage: null,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            successMessage: 'Your password has been changed successfully.',
            errorMessage: null,
          ),
        );
      },
    );
  }

  void formValidateOnChangePassword() {
    if (formKey.currentState!.validate()) {
      changePassword();
    }
  }

  @override
  Future<void> close() {
    oldPassword.dispose();
    newPassword.dispose();
    rePassword.dispose();
    return super.close();
  }
}
