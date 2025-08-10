import 'package:exam_app/features/home/sections/explore/questions/domain/entities/answer_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@JsonSerializable()
class AnswerModel extends AnswerEntity {
  @override
  final String answer;
  @override
  final String key;


  AnswerModel({
    required this.answer,
    required this.key,
  }) : super(answer: answer, key: key);

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
