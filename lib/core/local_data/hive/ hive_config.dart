import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/features/home/sections/result/data/model/answer_info_model.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
import 'package:exam_app/features/home/sections/result/data/model/question_info_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

 class HiveConfig {
  static Future<void> hiveConfiguration() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ExamInfoModelAdapter());
    Hive.registerAdapter(QuestionInfoModelAdapter());
    Hive.registerAdapter(AnswerInfoModelAdapter());

    await Hive.openBox<ExamInfoModel>(Constant.examResultBox);
  }
}
