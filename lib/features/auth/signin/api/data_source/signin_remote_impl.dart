import 'package:exam_app/features/auth/signin/api/client/api_client.dart';
import 'package:exam_app/features/auth/signin/data/data_source/signin_remote.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SigninRemote)
class SigninRemoteImpl extends SigninRemote {
  final ApiClient apiClient;

  SigninRemoteImpl({required this.apiClient});
  @override
  Future<SigninResponse> signIn({required SigninRequest request}) async {
    return await apiClient.signIn(request);
  }
}
