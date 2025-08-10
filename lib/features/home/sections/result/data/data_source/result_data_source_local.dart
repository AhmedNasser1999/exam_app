import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';

abstract class ResultDataSourceLocal {
  Future<List<ExamInfoEntity>> getAllResultExam();
}
