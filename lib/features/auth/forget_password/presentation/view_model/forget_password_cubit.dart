import 'dart:developer';

import 'package:exam_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/reset_password_token_request.dart';
import 'package:exam_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
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

    response.fold(
      (l) {
        log(l.info.toString());
        emit(ForgetPasswordVerifiedCode());
      },
      (r) {
        emit(ForgetPasswordFailure(errorMessage: r.errorMessage));
      },
    );
  }

  verifiedCode({required String code}) async {
    if (isClosed) return;
    emit(ForgetPasswordLoading());
    var response = await _verifyResetCodeUseCase.call(
      VerifyResetCodeRequest(resetCode: code),
    );
    response.fold(
      (l) {
        log(l.status.toString());
        emit(ForgetPasswordResetPassword());
      },
      (r) {
        emit(ForgetPasswordFailure(errorMessage: r.errorMessage));
      },
    );
  }

  resetPassword({required ResetPasswordTokenRequest request}) async {
    if (isClosed) return;
    emit(ForgetPasswordLoading());
    var response = await _resetPasswordUseCase.call(request);
    response.fold(
      (l) {
        log(l.token);
        emit(ResetPasswordSuccess());
      },
      (r) {
        emit(ForgetPasswordFailure(errorMessage: r.errorMessage));
      },
    );
  }

  String? confirmPassword({
    required String? value,
    required TextEditingController confirmPasswordController,
    required TextEditingController passwordController,
  }) {
    if (value == null || value.isEmpty) {
      return 'Invalid data';
    }
    if (value.length <= 6) {
      return 'Password must be contain 6 characters';
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
