import 'package:json_annotation/json_annotation.dart';

class AnswerEntity {
  final String answer;
  final String key;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected;


  AnswerEntity({
    required this.answer,
    required this.key,
    this.isSelected = false,

  });
}
