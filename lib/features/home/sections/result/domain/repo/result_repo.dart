import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';

abstract class ResultRepo {
  Future<Either<List<ExamInfoModel>, Failure>> getAllResult();
}
