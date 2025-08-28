import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/data/repo_impl/signup_repo_impl.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
import 'package:exam_app/features/auth/signup/domain/repo/signup_repo.dart';
import 'package:exam_app/features/auth/signup/domain/use_case/use_case_signup.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'use_case_signup_test.mocks.dart';

@GenerateMocks([SignupRepoImpl, SignupRequestModel])
void main() {
  late SignupRepo signupRepo;
  late UseCaseSignup useCaseSignup;
  late SignupRequestModel signupRequestModel;
  final SignupEntities signupEntities = SignupEntities(
    email: "",
    tokenEntities: "fake response Token",
    userName: "",
  );
  setUpAll(() {
    provideDummy<ApiResult<SignupEntities>>(
      SuccessApiResult<SignupEntities>(data: signupEntities),
    );

    signupRequestModel = MockSignupRequestModel();
    signupRepo = MockSignupRepoImpl();
    useCaseSignup = UseCaseSignup(signupRepo: signupRepo);
  });

  group("test SignUp UseCase", () {
    test("SignUp UseCse Success test", () async {
      ///AAA
      ///Arrange
      when(signupRepo.signup(signupReq: signupRequestModel)).thenAnswer(
        (_) async => SuccessApiResult<SignupEntities>(data: signupEntities),
      );

      ///Act
      final result = await useCaseSignup.call(signupRequestModel);

      ///Assert
      expect(result, isA<SuccessApiResult<SignupEntities>>());
      SuccessApiResult<SignupEntities> successApiResult =
          result as SuccessApiResult<SignupEntities>;
      expect(result.data.tokenEntities, equals(signupEntities.tokenEntities));
    });
    test("SignUp UseCse DioException test", () async {
      ///AAA
      ///Arrange
      when(signupRepo.signup(signupReq: signupRequestModel)).thenAnswer(
        (_) async => FailureApiResult<SignupEntities>(
          error: ServerFailure(errorMessage: "Fake message"),
        ),
      );

      ///Act
      final result = await useCaseSignup.call(signupRequestModel);

      ///Assert
      expect(result, isA<FailureApiResult<SignupEntities>>());
      // SuccessApiResult<SignupEntities> successApiResult =
      //     result as SuccessApiResult<SignupEntities>;
      // expect(result.data.tokenEntities, equals(signupEntities.tokenEntities));
    });
  });
}
