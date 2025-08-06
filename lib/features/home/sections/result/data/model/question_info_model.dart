import 'package:exam_app/features/home/sections/result/data/model/answer_info_model.dart';
import 'package:hive/hive.dart';
part 'question_info_model.g.dart';

@HiveType(typeId: 1)
class QuestionInfoModel extends HiveObject {
  @HiveField(0)
  final String question;
  @HiveField(1)
  final String correct;
  @HiveField(2)
  final List<AnswerInfoModel> questionAnswer;

  QuestionInfoModel({
    required this.question,
    required this.correct,
    required this.questionAnswer,
  });
}
