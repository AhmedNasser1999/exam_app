import 'package:exam_app/features/home/sections/result/data/model/answer_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

class AnswerEntity extends AnswerInfoModel {
  final String answer;
  final String key;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected;

  AnswerEntity({
    required this.answer,
    required this.key,
    this.isSelected = false,
  }) : super(answer: answer, isSelected: isSelected, key: key);
}
