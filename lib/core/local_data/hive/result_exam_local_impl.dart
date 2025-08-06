import 'dart:developer';

import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResultExamLocal)
class ResultExamLocalImpl extends ResultExamLocal {
  final box = Hive.box<ExamInfoModel>(Constant.examResultBox);
  @override
  Future<void> saveExamResult({required ExamInfoModel examInfo}) async {
    await box.add(examInfo);
  }

  @override
  List<ExamInfoModel> getExamResult() {
    List<ExamInfoModel> examsResult = box.values.toList();
    return examsResult;
  }

  @override
  void deleteAllResult() {
    log("delete all result");
    box.clear();
  }
}
