import 'package:exam_app/features/home/sections/result/data/model/question_info_model.dart';
import 'package:hive/hive.dart';
part 'exam_info_model.g.dart';

@HiveType(typeId: 0)
class ExamInfoModel extends HiveObject {
  @HiveField(0)
  final String examName;
  @HiveField(1)
  final int time;
  @HiveField(3)
  final int numberOfQuestion;
  @HiveField(4)
  final List<QuestionInfoModel> allQuestionInfo;

  ExamInfoModel({
    required this.examName,
    required this.time,
    required this.numberOfQuestion,
    required this.allQuestionInfo,
  });
}
