import 'package:exam_app/features/auth/signin/api/client/api_client.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixture/login/fixture_auth.dart';
import 'signin_remote_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("signin remote impl ...", () {
    late MockApiClient mockApiClient;
    final SigninRequest signinRequest = FixtureAuth.signinRequest();
    final SigninResponse signinResponse = FixtureAuth.signinResponse();
    setUp(() {
      mockApiClient = MockApiClient();
    });
    test("Signin test Call ApiClient", () async {
      //Arrange
      when(
        mockApiClient.signIn(signinRequest),
      ).thenAnswer((_) async => signinResponse);
      //Act
      final result = await mockApiClient.signIn(signinRequest);
      //Assert
      expect(result, isA<SigninResponse>());
      expect(result.token, equals(signinResponse.token));
      verify(mockApiClient.signIn(signinRequest)).called(1);
    });
  });
}
