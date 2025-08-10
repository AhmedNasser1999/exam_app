import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';

abstract class ResultRepo {
  Future<Either<List<ExamInfoEntity>, Failure>> getAllResult();
}
