import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';

abstract class ResultRepo {
  Future<ApiResult<List<ExamInfoEntity>>> getAllResult();
}
