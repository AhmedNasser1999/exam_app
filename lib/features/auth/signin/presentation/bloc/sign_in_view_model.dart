import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';

import 'package:exam_app/features/auth/signin/domain/use_cases/signin_usecase.dart';
import 'package:exam_app/features/auth/signin/presentation/bloc/sign_in_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'sign_in_state.dart';

@injectable
class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  final SigninUseCase signInUseCase;

  bool isRememberMe = false;
  SignInViewModel({required this.signInUseCase}) : super(SignInInitial()) {
    on<SignInSuccessEvent>(_signIn);
    on<SignInRememberMeEvent>(_rememberMe);
    on<SignInFormValidateEvent>(_formValidateSignIn);
  }

  Future<void> _signIn(SignInSuccessEvent event, Emitter emit) async {
    emit(SignInLoading());
    final userToken = await signInUseCase.call(
      SigninRequest(
        email: event.emailController.text,
        password: event.passwordController.text,
        isRememberMe: isRememberMe,
      ),
    );
    switch (userToken) {
      case ApiSuccess<UserEntities>():
        emit(SignInSuccess());
      case ApiFailure<UserEntities>():
        emit(SignInFailure(userToken.failure.errorMessage));
    }
  }

  void _rememberMe(SignInRememberMeEvent event, Emitter emit) {
    isRememberMe = isRememberMe == false ? true : false;
    emit(SignInRememberMe());
  }

  void _formValidateSignIn(SignInFormValidateEvent event, Emitter emit) {
    if (event.formKey.currentState!.validate()) {
      add(
        SignInSuccessEvent(
          emailController: event.emailController,
          passwordController: event.passwordController,
        ),
      );
    }
  }
}
