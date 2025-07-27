

import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';

import 'package:exam_app/features/auth/signin/domain/use_cases/signin_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SigninUseCase signInUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;
  SignInCubit({required this.signInUseCase}) : super(SignInInitial());

  Future<void> signIn() async {
    emit(SignInLoading());
    final userToken = await signInUseCase.call(
      SigninRequest(
        email: emailController.text,
        password: passwordController.text,
        isRememberMe: isRememberMe,
      ),
    );

    userToken.fold(
      (l) async {
    
        emit(SignInSuccess());
      },
      (r) {
        emit(SignInFailure(r.errorMessage));
      },
    );
  }


  void rememberMe() {
    isRememberMe = isRememberMe == false ? true : false;
    emit(SignInRememberMe());
  }

  formValidateSignIn({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      signIn();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
