import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static Future<void> hiveConfiguration() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ExamInfoEntityAdapter());
    Hive.registerAdapter(QuestionsEntityAdapter());
    Hive.registerAdapter(AnswerEntityAdapter());

    await Hive.openBox<ExamInfoEntity>(Constant.examResultBox);
  }
}
