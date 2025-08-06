import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/domain/use_case/use_case_signup.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.useCaseSignup) : super(SignupInitial());
  final UseCaseSignup useCaseSignup;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  signup({required SignupRequestModel signupReq}) async {
    emit(SignupLoading());
    var request = await useCaseSignup.call(signupReq);
    request.fold(
      (success) {
        emit(SignupSuccess());
      },
      (failure) {
        emit(SignupFailure(errorMessage: failure.errorMessage));
      },
    );
  }

  validate({required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState!.validate()) {
      await signup(
        signupReq: SignupRequestModel(
          username: userNameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
          phone: phoneController.text,
        ),
      );
      print('userNameController: ${userNameController.text}');
      print('firstNameController: ${firstNameController.text}');
      print('lastNameController: ${lastNameController.text}');
      print('emailController: ${emailController.text}');
      print('passwordController: ${passwordController.text}');
      print('confirmPasswordController: ${confirmPasswordController.text}');
      print('phoneController: ${phoneController.text}');
    }
    return;
  }

  String? confirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid data';
    }

    if (confirmPasswordController.text != passwordController.text) {
      return 'Password no match';
    }
    return null;
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
