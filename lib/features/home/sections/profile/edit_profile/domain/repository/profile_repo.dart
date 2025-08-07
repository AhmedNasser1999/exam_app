import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/data/models/profile_request_model.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/response_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ResponseEntity>> editProfile(
    ProfileRequestModel request,
  );

  Future<Either<Failure, ProfileEntity>> getProfileData();
  Future<void> logout();
}
