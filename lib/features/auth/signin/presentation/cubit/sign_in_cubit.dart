import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/use_cases/remember_me_use_case.dart';
import 'package:exam_app/features/auth/signin/domain/use_cases/signin_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SigninUseCase signInUseCase;
  final RememberMeUseCase rememberMeUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;
  SignInCubit({required this.signInUseCase, required this.rememberMeUseCase})
    : super(SignInInitial());

  Future<void> signIn() async {
    emit(SignInLoading());
    final userToken = await signInUseCase.call(
      SigninRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    userToken.fold(
      (l) async {
        if (isRememberMe) {
          await saveToken(token: l.token);
        }
        emit(SignInSuccess());
      },
      (r) {
        emit(SignInFailure(r.errorMessage));
      },
    );
  }

  Future<void> saveToken({required String token}) async {
    await rememberMeUseCase.call(token: token);
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
