import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/auth/signin/domain/use_cases/signin_use_case.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixture/login/fixture_auth.dart';
import 'sign_in_cubit_test.mocks.dart';

@GenerateMocks([SigninUseCase])
void main() {
  group("SignIn cubit test", () {
    late SignInCubit signInCubit;
    late MockSigninUseCase mockSigninUseCase;
    SigninRequest signinRequest = FixtureAuth.signinRequest();
    UserEntities userEntities = FixtureAuth.userEntities();
    final DioException dioException = DioException(
      requestOptions: RequestOptions(),
      message: "Fake_Error_Message",
    );
    final expectLoginSuccess = SuccessApiResult<UserEntities>(
      data: userEntities,
    );
    final expectLoginFailure = FailureApiResult<UserEntities>(
      error: ServerFailure.fromDio(dioException),
    );
    setUp(() {
      mockSigninUseCase = MockSigninUseCase();
      signInCubit = SignInCubit(signInUseCase: mockSigninUseCase);
      provideDummy<ApiResult<UserEntities>>(expectLoginSuccess);
      provideDummy<ApiResult<UserEntities>>(expectLoginFailure);
    });
    blocTest(
      "test sign in cubit success state",
      build: () => signInCubit,
      act: (cubit) async {
        when(
          mockSigninUseCase.call(signinRequest),
        ).thenAnswer((_) async => expectLoginSuccess);
        cubit.signIn(signinRequest);
      },
      expect: () => [SignInLoading(), SignInSuccess()],
      verify: (_) {
        verify(mockSigninUseCase.call(signinRequest)).called(1);
      },
    );
    blocTest(
      "test sign in cubit failure state",
      build: () => signInCubit,
      act: (cubit) async {
        when(
          mockSigninUseCase.call(signinRequest),
        ).thenAnswer((_) async => expectLoginFailure);
        cubit.signIn(signinRequest);
      },
      expect: () => [
        SignInLoading(),
        SignInFailure(expectLoginFailure.error.errorMessage),
      ],
      verify: (_) {
        verify(mockSigninUseCase.call(signinRequest)).called(1);
      },
    );
  });
}
