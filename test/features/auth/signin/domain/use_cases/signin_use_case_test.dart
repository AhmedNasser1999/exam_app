import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/auth/signin/data/repository/signin_repository_impl.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/auth/signin/domain/use_cases/signin_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixture/login/fixture_auth.dart';
import 'signin_use_case_test.mocks.dart';

@GenerateMocks([SigninRepositoryImpl])
void main() {
  group("signin use case ...", () {
    late MockSigninRepositoryImpl mockSigninRepositoryImpl;
    late SigninUseCase signinUseCase;
    final request = FixtureAuth.signinRequest();
    final responseEntity = FixtureAuth.userEntities();
    final expectSuccess = SuccessApiResult<UserEntities>(data: responseEntity);
    DioException dioException = DioException(
      requestOptions: RequestOptions(),
      message: "fake_error",
    );
    final expectFailure = FailureApiResult<UserEntities>(
      error: ServerFailure.fromDio(dioException),
    );
    setUp(() {
      mockSigninRepositoryImpl = MockSigninRepositoryImpl();
      signinUseCase = SigninUseCase(repository: mockSigninRepositoryImpl);
      provideDummy<ApiResult<UserEntities>>(
        SuccessApiResult<UserEntities>(data: responseEntity),
      );
      provideDummy<ApiResult<UserEntities>>(
        FailureApiResult<UserEntities>(
          error: ServerFailure.fromDio(dioException),
        ),
      );
    });
    test('success useCase', () async {
      // Arrange
      when(
        mockSigninRepositoryImpl.signin(request: request),
      ).thenAnswer((_) async => expectSuccess);

      // Act
      final result = await signinUseCase.call(request);

      // Assert
      expect(result, isA<SuccessApiResult<UserEntities>>());
      final newResult = result as SuccessApiResult<UserEntities>;
      expect(result.data.token, equals(responseEntity.token));

      verify(mockSigninRepositoryImpl.signin(request: request)).called(1);
    });
    test('dioError useCase', () async {
      // Arrange
      when(
        mockSigninRepositoryImpl.signin(request: request),
      ).thenAnswer((_) async => expectFailure);

      // Act
      final result = await signinUseCase.call(request);

      // Assert
      expect(result, isA<FailureApiResult<UserEntities>>());
      final newResult = result as FailureApiResult<UserEntities>;
      // expect(result.error.errorMessage, equals(newResult.error.errorMessage));

      verify(mockSigninRepositoryImpl.signin(request: request)).called(1);
    });
  });
}
