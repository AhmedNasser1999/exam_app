import 'dart:developer';

import 'package:exam_app/features/auth/signup/api/client/signup_api_client.dart';
import 'package:exam_app/features/auth/signup/api/model/signup_request/signup_request_model.dart';
import 'package:exam_app/features/auth/signup/data/data_source/signup_remote.dart';
import 'package:exam_app/features/auth/signup/domain/entities/signup_entities.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRemote)
class SignupRemoteImpl extends SignupRemote {
  final SignupApiClient signupApiClient;

  SignupRemoteImpl({required this.signupApiClient});
  @override
  Future<SignupEntities> signup({required SignupRequestModel signupReq}) async {
    var response = await signupApiClient.signup(signupReq);
    return response;
  }
}
