import 'package:hive/hive.dart';
part 'answer_info_model.g.dart';

@HiveType(typeId: 2)
class AnswerInfoModel extends  HiveObject{
  @HiveField(0)
  final bool isSelected;
  @HiveField(1)
  final String key;
  @HiveField(2)
  final String answer;

  AnswerInfoModel({
    required this.isSelected,
    required this.key,
    required this.answer,
  });
}
