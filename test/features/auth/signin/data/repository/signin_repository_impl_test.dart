import 'package:dio/dio.dart';
import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/auth/signin/data/data_source/signin_remote.dart';
import 'package:exam_app/features/auth/signin/data/repository/signin_repository_impl.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user_entities.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixture/login/fixture_auth.dart';
import 'signin_repository_impl_test.mocks.dart';

@GenerateMocks([UserTokenStorage, SigninRemote])
void main() {
  group('signin repo impl', () {
    late SigninRepositoryImpl repository;
    late SigninRemote mockRemote;
    late UserTokenStorage mockUserTokenStorage;
    setUp(() {
      mockRemote = MockSigninRemote();
      mockUserTokenStorage = MockUserTokenStorage();
      repository = SigninRepositoryImpl(
        signinRemote: mockRemote,
        storeUserToken: mockUserTokenStorage,
      );
    });
    final request = FixtureAuth.signinRequest();
    final response = FixtureAuth.signinResponse();
    final responseEntity = FixtureAuth.userEntities();

    test('should return Left(UserEntities) when signin succeeds', () async {
      // Arrange
      when(
        mockRemote.signIn(request: request),
      ).thenAnswer((_) async => response);

      // Act
      final result = await repository.signin(request: request);

      // Assert
      expect(result, isA<SuccessApiResult<UserEntities>>());
      final newResult = result as SuccessApiResult<UserEntities>;
      expect(result.data.token, equals(responseEntity.token));

      verify(mockRemote.signIn(request: request)).called(1);
      verifyNoMoreInteractions(mockRemote);
    });

    test(
      'should return Right(ServerFailure) when DioException is thrown',
      () async {
        // Arrange
        final dioError = DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionError,
        );
        when(mockRemote.signIn(request: request)).thenThrow(dioError);

        // Act
        final result = await repository.signin(request: request);

        // Assert
        expect(result, isA<FailureApiResult>());
      },
    );
    test(
      'should return Right(ServerFailure) when DioException is thrown',
      () async {
        // Arrange
        final error = Exception();
        when(mockRemote.signIn(request: request)).thenThrow(error);

        // Act
        final result = await repository.signin(request: request);

        // Assert
        expect(result, isA<FailureApiResult>());
      },
    );
  });
}
