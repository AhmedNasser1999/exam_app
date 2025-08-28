import 'package:exam_app/features/auth/signin/api/client/api_client.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixture/login/fixture_auth.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("Group Test ApiClient", () {
    late MockApiClient mockApiClient;
    final SigninRequest signinRequest = FixtureAuth.signinRequest();
    final SigninResponse signinResponse = FixtureAuth.signinResponse();
    setUp(() {
      mockApiClient = MockApiClient();
    });
    test("Test ApiClient Function Call Success", () async {
      //Arrange
      when(
        mockApiClient.signIn(signinRequest),
      ).thenAnswer((_) async => signinResponse);
      //Act
      final result = await mockApiClient.signIn(signinRequest);
      //Assert
      expect(result, isA<SigninResponse>());
      verify(mockApiClient.signIn(signinRequest)).called(1);
    });
  });
}
