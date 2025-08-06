import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';

abstract class ResultDataSourceLocal {
  Future<List<ExamInfoModel>> getAllResultExam();
}
