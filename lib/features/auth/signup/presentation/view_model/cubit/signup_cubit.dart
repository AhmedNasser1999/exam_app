import 'package:bloc/bloc.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/domain/use_case/use_case_signup.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.useCaseSignup}) : super(SignupInitial());
  final UseCaseSignup useCaseSignup;
  signup({required SignupRequestModel signupReq}) async {
    var request = await useCaseSignup.call(signupReq);
    request.fold(
      (success) => emit(SignupSuccess()),
      (failure) => emit(SignupFailure(errorMessage: failure.errorMessage)),
    );
  }
}
