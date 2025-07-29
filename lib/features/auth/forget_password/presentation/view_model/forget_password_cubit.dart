import 'dart:developer';

import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/forget_password_success.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/user_reset_password_token.dart';
import 'package:exam_app/features/auth/forget_password/domain/entities/verify_reset_code.dart';
import 'package:exam_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:exam_app/features/auth/forget_password/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this._forgetPasswordUseCase,
    this._resetPasswordUseCase,
    this._verifyResetCodeUseCase,
  ) : super(ForgetPasswordInitial());
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;

  sendEmailCode({required String email}) async {
    if (isClosed) return;
    emit(ForgetPasswordLoading());
    var response = await _forgetPasswordUseCase.call(
      ForgetPasswordRequest(email: email),
    );
    switch (response) {
      case ApiSuccess<ForgetPasswordSuccess>():
        emit(ForgetPasswordVerifiedCode());
      case ApiFailure<ForgetPasswordSuccess>():
        emit(
          ForgetPasswordFailure(errorMessage: response.failure.errorMessage),
        );
    }
  }

  verifiedCode({required String code}) async {
    if (isClosed) return;
    emit(ForgetPasswordLoading());
    var response = await _verifyResetCodeUseCase.call(
      VerifyResetCodeRequest(resetCode: code),
    );
    switch (response) {
      case ApiSuccess<VerifyResetCode>():
        emit(ForgetPasswordResetPassword());
      case ApiFailure<VerifyResetCode>():
        emit(
          ForgetPasswordFailure(errorMessage: response.failure.errorMessage),
        );
    }
  }

  resetPassword({required ResetPasswordTokenRequest request}) async {
    if (isClosed) return;
    emit(ForgetPasswordLoading());
    var response = await _resetPasswordUseCase.call(request);
    switch (response) {
      case ApiSuccess<UserResetPasswordToken>():
        emit(ResetPasswordSuccess());
      case ApiFailure<UserResetPasswordToken>():
        emit(
          ForgetPasswordFailure(errorMessage: response.failure.errorMessage),
        );
    }
  }

  String? confirmPassword({
    required String? value,
    required TextEditingController confirmPasswordController,
    required TextEditingController passwordController,
  }) {
    if (value == null || value.isEmpty) {
      return 'Invalid data';
    }
    if (confirmPasswordController.text != passwordController.text) {
      return 'Password no match';
    }
    return null;
  }

  formValidateEmail({
    required GlobalKey<FormState> formKey,
    required String email,
  }) {
    if (formKey.currentState!.validate()) {
      sendEmailCode(email: email);
    }
  }

  formValidateResetPassword({
    required GlobalKey<FormState> formKey,
    required ResetPasswordTokenRequest request,
  }) {
    if (formKey.currentState!.validate()) {
      resetPassword(request: request);
    }
  }
}
