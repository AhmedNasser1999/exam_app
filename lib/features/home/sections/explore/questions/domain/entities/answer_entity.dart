import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answer_entity.g.dart';
@HiveType(typeId: 2)
class AnswerEntity extends HiveObject {
  @HiveField(0)
  final String answer;
  @override
  @HiveField(1)
  final String key;
  @HiveField(2)
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected;

  AnswerEntity({
    required this.answer,
    required this.key,
    this.isSelected = false,
  });
}
