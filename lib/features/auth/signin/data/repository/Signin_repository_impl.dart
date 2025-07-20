import 'package:exam_app/features/auth/signin/api/api_client.dart';
import 'package:exam_app/features/auth/signin/data/models/signin_request.dart';
import 'package:exam_app/features/auth/signin/domain/entities/user.dart';
import 'package:exam_app/features/auth/signin/domain/repository/signin_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SigninRepositoryImpl extends SigninRepository {
  final ApiClient apiClient;
  SigninRepositoryImpl(this.apiClient);
  @override
  Future<User> signin(String email, String password) async {
    final response = await apiClient.login(
      SigninRequest(email: email, password: password),
    );
    return User(token: response.token);
  }
}
