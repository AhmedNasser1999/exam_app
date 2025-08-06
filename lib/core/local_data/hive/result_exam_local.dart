import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';

abstract class ResultExamLocal {
  saveExamResult({required ExamInfoModel examInfo});
  List<ExamInfoModel> getExamResult();
  void deleteAllResult();
}
