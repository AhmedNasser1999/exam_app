import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:hive/hive.dart';
part 'exam_info_entity.g.dart';

@HiveType(typeId: 0)
class ExamInfoEntity extends HiveObject {
  @HiveField(0)
  final String examName;
  @HiveField(1)
  final int numberOfQuestion;
  @HiveField(2)
  final int correct;
  @HiveField(3)
  final int time;
  @HiveField(4)
  final List<QuestionsEntity> listQuestion;

  ExamInfoEntity({
    required this.time,
    required this.examName,
    required this.numberOfQuestion,
    required this.correct,
    required this.listQuestion,
  });
}
