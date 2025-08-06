import 'dart:developer';

import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResultExamLocal)
class ResultExamLocalImpl extends ResultExamLocal {
  final box = Hive.box<ExamInfoEntity>(Constant.examResultBox);
  @override
  Future<void> saveExamResult({required ExamInfoEntity examInfo}) async {
    await box.add(examInfo);
  }

  @override
  List<ExamInfoEntity> getExamResult() {
    List<ExamInfoEntity> examsResult = box.values.toList();
    return examsResult;
  }

  @override
  void deleteAllResult() {
    log("delete all result");
    box.clear();
  }
}
