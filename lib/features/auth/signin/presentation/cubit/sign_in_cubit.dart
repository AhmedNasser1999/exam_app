import 'package:exam_app/features/auth/signin/domain/use_cases/signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SigninUsecase signInUseCase;

  SignInCubit(this.signInUseCase) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    try {
      await signInUseCase.execute(email, password);
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}
