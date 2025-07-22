import 'package:exam_app/features/auth/signin/api/store_user_token.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user.dart';
import 'package:exam_app/features/auth/signin/domain/use_cases/signin_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SigninUseCase signInUseCase;
  final StoreUserToken storeUserToken;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInCubit(this.signInUseCase, this.storeUserToken) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    try {
      User userToken = await signInUseCase.execute(email, password);

      await storeUserToken.saveToken(userToken.token);

      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}
