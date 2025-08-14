import 'package:dio/dio.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/features/auth/signin/data/data_source/signin_remote.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';
import 'package:exam_app/features/auth/signin/data/repository/signin_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signin_repository_impl_test.mocks.dart';

// 1️⃣ Create mock class
@GenerateMocks([UserTokenStorage, SigninRemote])
void main() {
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

  group('signin', () {
    final request = SigninRequest(
      email: 'test@example.com',
      password: '123456',
      isRememberMe: false,
    );
    final response = SigninResponse(token: 'fakeToken');

    test('should return Left(UserEntities) when signin succeeds', () async {
      // Arrange
      when(
        mockRemote.signIn(request: request),
      ).thenAnswer((_) async => response);

      // Act
      final result = await repository.signin(request: request);

      // Assert
      expect(result.isLeft(), true);
      result.fold((user) {
        expect(user.token, equals('fakeToken'));
      }, (_) => fail('Expected a UserEntities on success'));

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
        expect(result.isRight(), true);
        result.fold((_) => fail('Expected a Failure on DioException'), (
          failure,
        ) {
          expect(failure, isA<ServerFailure>());
        });
      },
    );

    test(
      'should return Right(ServerFailure) when unknown exception is thrown',
      () async {
        // Arrange
        when(
          mockRemote.signIn(request: request),
        ).thenThrow(Exception('Unknown error'));

        // Act
        final result = await repository.signin(request: request);

        // Assert
        expect(result.isRight(), true);
        result.fold((_) => fail('Expected a Failure on unknown exception'), (
          failure,
        ) {
          expect(failure, isA<ServerFailure>());
          expect(failure.errorMessage, contains('Unknown error'));
        });
      },
    );
  });
}
